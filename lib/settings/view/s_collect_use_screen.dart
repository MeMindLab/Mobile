import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CollectUseScreen extends StatefulWidget {
  const CollectUseScreen({super.key});

  @override
  State<CollectUseScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CollectUseScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse(
      "https://tattered-zebu-41d.notion.site/96bf5b1fca3741498298a592daccaf8c");
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
        onPopInvoked: (isPop) => _goBack(context),
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
