import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Naver extends StatefulWidget {
  final String url;
  const Naver({Key? key, required this.url}) : super(key: key);

  @override
  State<Naver> createState() => _NaverState();
}

class _NaverState extends State<Naver> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true; // for indicator
  late TextEditingController searchsite;
  late String siteName;

  @override
  void initState() {
    siteName = widget.url;
    super.initState();
    searchsite = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://$siteName',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              // 화면? 끝나면,
              onPageFinished: (finish) {
                setState(() {
                  // 뺑뺑 도는거 멈춰!
                  isLoading = false;
                });
              },
              onPageStarted: (start) {
                setState(() {
                  // 시작하면 돌아라!
                  isLoading = true;
                });
              },
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // 아니면 위의 Stack으로 돌아가라
                : Stack()
          ],
        ),
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goBack();
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ],
            );
          }
          return Stack();
        },
      ),
    );
  }
}
