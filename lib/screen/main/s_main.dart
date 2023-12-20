import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:me_mind/chat/view/s_chat.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse("https://diary-web-test.vercel.app");
  late final InAppWebViewController webViewController;
  late final PullToRefreshController pullToRefreshController;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    setBottomIdx(0);

    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          webViewController.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          webViewController.loadUrl(
              urlRequest: URLRequest(url: await webViewController.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const RootTab(),
      title: "로고",
      child: SafeArea(
          child: WillPopScope(
              onWillPop: () => _goBack(context),
              child: Column(children: <Widget>[
                progress < 1.0
                    ? LinearProgressIndicator(
                        value: progress, color: Colors.blue)
                    : Container(),
                Expanded(
                    child: Stack(children: [
                  InAppWebView(
                    key: webViewKey,
                      initialData: InAppWebViewInitialData(
                          data: """
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
      <h1 onclick="call()">JavaScript Handlers (Channels) TEST</h1>
      <script>
        function call() {
          window.flutter_inappwebview
                      .callHandler('clickReport', 1, true, ['bar', 5], {foo: 'baz'});
        }
        window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
            window.flutter_inappwebview.callHandler('clickReport')
              .then(function(result) {
                // print to the console the data coming
                // from the Flutter side.
                console.log(JSON.stringify(result));
            });
        });
      </script>
    </body>
</html>
                      """),
                    // initialUrlRequest: URLRequest(url: myUrl),
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
                    onLoadStop: (InAppWebViewController controller, uri) {
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
                    onWebViewCreated: (InAppWebViewController controller) {
                      webViewController = controller;
                      // webViewController.addJavaScriptHandler(handlerName: 'clickReport', callback: (args) {
                      //   return {
                      //     'bar': 'bar_value', 'baz': 'baz_value'
                      //   };
                      // });

                      webViewController.addJavaScriptHandler(handlerName: 'clickReport', callback: (args) {
                        print(args);
                        if (args.length > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Chat()),
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
              ]))),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
