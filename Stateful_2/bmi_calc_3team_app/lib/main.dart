import 'package:flutter/material.dart';
import 'package:bmi_calc_3team_app/sw_page.dart';
import 'package:bmi_calc_3team_app/sm_page.dart';
import 'package:bmi_calc_3team_app/yy_page.dart';
import 'package:bmi_calc_3team_app/gs_page.dart';
import 'package:bmi_calc_3team_app/gh_page.dart';
import 'package:bmi_calc_3team_app/yj_page.dart';

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
        primarySwatch: Colors.pink,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
  }

  // dispose는 정리해주는 역할
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기 모음'),
        toolbarHeight: 80,
      ),
      body: TabBarView(
        controller: controller,
        // ignore: prefer_const_literals_to_create_immutables
        children: const [
          GhPage(),
          GsPage(),
          SmPage(),
          SwPage(),
          YjPage(),
          YyPage()
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.red,
              ),
              text: "양귀현",
            ),
            Tab(
              icon: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.orange,
              ),
              text: "강가슬",
            ),
            Tab(
              icon: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.yellow,
              ),
              text: "이승민",
            ),
            Tab(
              icon: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.green,
              ),
              text: "유시웅",
            ),
            Tab(
              icon: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.blue,
              ),
              text: "권영진",
            ),
            Tab(
              icon: Icon(
                Icons.card_membership_outlined,
                color: Colors.purple,
              ),
              text: '정유영',
            ),
          ],
        ),
      ),
    );
  }
}
