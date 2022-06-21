import 'package:flutter/material.dart';
import 'page.dart';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'WebView - Tabbar',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        )),
        toolbarHeight: 100,
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Naver(url: 'www.naver.com'),
          Naver(url: 'www.google.com'),
          Naver(url: 'www.daum.net'),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Image.asset(
              "images/naver.png",
              width: 40,
            ),
            text: "Naver",
          ),
          Tab(
            icon: Image.asset(
              'images/google.png',
              width: 40,
            ),
            text: "Google",
          ),
          Tab(
            icon: Image.asset(
              'images/daum.png',
              width: 40,
            ),
            text: "Daum",
          ),
        ],
      ),
    );
  }
}
