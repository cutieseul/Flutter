import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // fot indicator
  String siteName = "www.daum.net";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.google.com';
                      });
                      _reloadSite();
                    },
                    child: const Text('Google'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.naver.com';
                      });
                      _reloadSite();
                    },
                    child: const Text('Naver'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.daum.net';
                      });
                      _reloadSite();
                    },
                    child: const Text('Daum'),
                  ),
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            //제한없이 쓸수있다.
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              isLoading = true;
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      //백버튼
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            //컨트롤러가 돌아갈 데이터가 있으면
            if (controller.hasData) {
              return FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  controller.data!.goBack();
                },
                child: const Icon(Icons.arrow_back),
              );
            }
            return Stack();
          }),
    );
  }

  //----
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('http://$siteName'));
  }
}//end
