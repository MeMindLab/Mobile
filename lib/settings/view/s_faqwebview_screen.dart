import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FaqWebviewScreen extends StatefulWidget {
  const FaqWebviewScreen({super.key});

  @override
  State<FaqWebviewScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FaqWebviewScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse(
      "https://tattered-zebu-41d.notion.site/FAQ-dc83b5bb897740058dcc66f96de7191f");
  late final InAppWebViewController webViewController;

  Future<bool> _goBack(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) => _goBack(context),
        child: Column(
          children: [
            Expanded(
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(url: myUrl),
                onWebViewCreated: (InAppWebViewController controller) {
                  webViewController = controller;
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
