import 'package:flutter/material.dart';
import 'package:tapbar_app/first_page.dart';
import 'package:tapbar_app/second_page.dart';

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

//with : 상속, 같이사용한다는뜻
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //length :탭바 몇개 쓸건지
    //vsync : 어디서 쓸건지
    controller = TabController(length: 2, vsync: this);
  }

//앱 죽을때 만들어 지는 애
  @override
  void dispose() {
    // super 위에 써줘야함
    controller.dispose(); // ????
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab bar Test'),
      // ),
      //앱바와 탭바 사이 가운데
      body: TabBarView(
        controller: controller,
        children: [
          //탭바에 따라서 보여지는 페이지
          FirstPage(), SecondPage()
        ],
      ),
      bottomNavigationBar: Container(
        //container로 감싼후 탭바 색깔 주기
        color: Colors.yellowAccent,
        //탭바 높이
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          //어느 페이지에 있는지 위치 알려줌
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: "one",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
              text: "two",
            ),
          ],
        ),
      ),
    );
  }
}
