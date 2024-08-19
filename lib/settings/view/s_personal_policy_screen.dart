import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PersonalPolicyScreen extends StatefulWidget {
  const PersonalPolicyScreen({super.key});

  @override
  State<PersonalPolicyScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PersonalPolicyScreen> {
  final GlobalKey webViewKey = GlobalKey();
  Uri myUrl = Uri.parse(
      "https://tattered-zebu-41d.notion.site/b1729cb7486446c68ba46a6866648955");
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
