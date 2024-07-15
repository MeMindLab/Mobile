import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ServiceUseScreen extends StatefulWidget {
  const ServiceUseScreen({super.key});

  @override
  State<ServiceUseScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ServiceUseScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse(
      "https://tattered-zebu-41d.notion.site/aac2b715e21e4fc4a7a72be8f4030e0e");
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
