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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  late TextEditingController searchsite;
  String siteName = "www.daum.net";

@override
  void initState() {
    super.initState();
    searchsite = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: '사이트 주소를 입력하세요',
                ),
                controller: searchsite,
                autocorrect: false,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.manage_search,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                if (searchsite.text.trim().isNotEmpty) {
                  siteName = searchsite.text.trim();
                }
              });
              _reloadSite();
            },
          ),
        ],
        toolbarHeight: 100,
      ),
      body: Stack(
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
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
         AsyncSnapshot<WebViewController> controller){
           if(controller.hasData){
            return FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: (){
                controller.data!.goBack();
              },
              child: const Icon(Icons.arrow_back),
            );
           }
           return Stack();
        },
      ),
    );
  }

  // --- Functions
  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('http://$siteName'));
  }
}