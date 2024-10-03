import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/chat/view/s_chat.dart';
import 'package:me_mind/chat/view/s_trash.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/lemon_number.dart';
import 'package:me_mind/common/services/token_refresh_service.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/settings/provider/theme_provider.dart';
import 'package:me_mind/settings/view/s_setting_theme.dart';
import 'package:me_mind/user/model/user_signin_model.dart';
import 'package:me_mind/user/view/s_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final GlobalKey webViewKey = GlobalKey();
  // Uri myUrl = Uri.parse("https://d2ygt4x04f8e42.cloudfront.net");
  Uri myUrl = Uri.parse("https://main--memind.netlify.app/");
  InAppWebViewController? webViewController;

  late final PullToRefreshController pullToRefreshController;
  String? token;
  String? refreshToken;
  String? themeMode;
  double progress = 0;

  Future<void> _loadToken() async {
    token = await storage.read(key: ACCESS_TOKEN);
    print(token);
    setState(() {});
  }

  void loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode = prefs.getString("themeMode");
    if (themeMode == null) {
      await prefs.setString('themeMode', 'general mode');
      themeMode = "general mode";
      ref.read(themeProvider.notifier).setTheme(AppTheme.basic);
    } else {
      themeMode == 'general mode'
          ? ref.read(themeProvider.notifier).setTheme(AppTheme.basic)
          : ref.read(themeProvider.notifier).setTheme(AppTheme.emotion);
    }

    print(themeMode);
    setState(() {});
  }

  void sendThemeWebview(
      InAppWebViewController controller, AppTheme theme) async {
    print("웹뷰에 토큰 보내는 중");
    String themeString = theme == AppTheme.basic
        ? """
         window.postMessage('emotion mode', '*');
         window.theme = 'emotion mode';
         """
        : """
         window.postMessage('general mode', '*');
         window.theme = 'general mode';
         """;

    await controller.evaluateJavascript(source: themeString);
  }

  Future<void> refreshTokenOrRedirectToLogin(
      {required InAppWebViewController controller}) async {
    try {
      final response = await TokenRefreshService().refresh();
      if (response is SignInResult) {
        await storage.write(key: ACCESS_TOKEN, value: response.accessToken);
        await storage.write(key: REFRESH_TOKEN, value: response.refreshToken);

        await controller.evaluateJavascript(source: """
                      window.flutter_inappwebview.callHandler('authError').then(function(token) {
                        window.receivedToken = token;
                        console.log("Token received from Flutter: " + token);
                        // 받은 토큰으로 필요한 작업 수행
                      });
                    """);
      } else {
        throw Error();
      }
    } catch (e) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const SignInScreen();
      }));
    }
  }

  @override
  void initState() {
    super.initState();

    setBottomIdx(0);
    _loadToken();
    loadTheme();

    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          webViewController!.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          webViewController!.loadUrl(
              urlRequest: URLRequest(url: await webViewController!.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);

    ref.listen(themeProvider, (pref, next) {
      print("지금 모드는 $next");

      if (webViewController != null) {
        sendThemeWebview(webViewController!, next);
      }
    });
    return DefaultLayout(
      backgroundColor: AppColors.blue1,
      bottomNavigationBar: const RootTab(),
      appBarBgColor: AppColors.blue1,
      appBarActions: [LemonNumberWidget()],
      isappBarImage: true,
      title: "로고",
      child: SafeArea(
          child: Column(children: <Widget>[
        progress < 1.0
            ? LinearProgressIndicator(value: progress, color: Colors.blue)
            : Container(),
        Expanded(
            child: Stack(children: [
          token == null && themeMode == null
              ? const Center(child: CircularProgressIndicator())
              : InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(
                      url: myUrl, headers: {"Authorization": "Bearer $token"}),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        javaScriptCanOpenWindowsAutomatically: true,
                        javaScriptEnabled: true,
                        useOnDownloadStart: true,
                        useOnLoadResource: true,
                        useShouldOverrideUrlLoading: true,
                        mediaPlaybackRequiresUserGesture: true,
                        allowFileAccessFromFileURLs: true,
                        allowUniversalAccessFromFileURLs: true,
                        verticalScrollBarEnabled: true,
                        userAgent:
                            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36'),
                    android: AndroidInAppWebViewOptions(
                        useHybridComposition: true,
                        allowContentAccess: true,
                        builtInZoomControls: true,
                        thirdPartyCookiesEnabled: true,
                        allowFileAccess: true,
                        supportMultipleWindows: true),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                      allowsBackForwardNavigationGestures: true,
                    ),
                  ),
                  pullToRefreshController: pullToRefreshController,
                  onLoadStart: (InAppWebViewController controller, uri) {
                    setState(() {
                      myUrl = uri!;
                    });
                  },
                  onLoadStop: (InAppWebViewController controller, uri) async {
                    controller.addJavaScriptHandler(
                        handlerName: "authError",
                        callback: (args) async {
                          await refreshTokenOrRedirectToLogin(
                              controller: controller);
                        });

                    controller.addJavaScriptHandler(
                        handlerName: "requestToken",
                        callback: (args) async {
                          debugPrint("토큰 전송");
                          return token;
                        });
                    await controller.evaluateJavascript(source: """
                      window.flutter_inappwebview.callHandler('requestToken').then(function(token) {
                        window.receivedToken = token;
                        console.log("Token received from Flutter: " + token);
                        // 받은 토큰으로 필요한 작업 수행
                      });
                    """);
                    setState(() {
                      myUrl = uri!;
                    });
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      pullToRefreshController.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                  androidOnPermissionRequest:
                      (controller, origin, resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },
                  onWebViewCreated: (InAppWebViewController controller) async {
                    webViewController = controller;
                    sendThemeWebview(controller, themeState);

                    webViewController!.addJavaScriptHandler(
                        handlerName: 'clickDiary',
                        callback: (args) {
                          debugPrint("자바스크립트 채널2");

                          if (args[0] == "diaryButton") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Chat(),
                              ),
                            );
                          }
                        });

                    webViewController!.addJavaScriptHandler(
                        handlerName: 'clickTrash',
                        callback: (args) {
                          debugPrint("자바스크립트 채널1");

                          if (args[0] == "trashButton") {
                            // 감정쓰레기통 스크린 이동
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Trash(),
                              ),
                            );
                          }
                        });
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    print(consoleMessage);
                  },
                  onCreateWindow: (controller, createWindowRequest) async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            child: InAppWebView(
                              // Setting the windowId property is important here!
                              windowId: createWindowRequest.windowId,
                              initialOptions: InAppWebViewGroupOptions(
                                android: AndroidInAppWebViewOptions(
                                  builtInZoomControls: true,
                                  thirdPartyCookiesEnabled: true,
                                ),
                                crossPlatform: InAppWebViewOptions(
                                    cacheEnabled: true,
                                    javaScriptEnabled: true,
                                    userAgent:
                                        "Mozilla/5.0 (Linux; Android 9; LG-H870 Build/PKQ1.190522.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36"),
                                ios: IOSInAppWebViewOptions(
                                  allowsInlineMediaPlayback: true,
                                  allowsBackForwardNavigationGestures: true,
                                ),
                              ),
                              onCloseWindow: (controller) async {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                    return true;
                  },
                )
        ]))
      ])),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await webViewController!.canGoBack()) {
      webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
