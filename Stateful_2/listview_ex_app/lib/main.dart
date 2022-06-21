import 'package:flutter/material.dart';
import 'package:listview_ex_app/first_page.dart';
import 'package:listview_ex_app/flag.dart';
import 'package:listview_ex_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //property
  late TabController controller;
  List<Flag> flagList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    flagList.add(Flag(
      imagesPath: 'images/austria.png',
      nationName: '오스트리아',
    ));

    flagList.add(Flag(
      imagesPath: 'images/belgium.png',
      nationName: '벨기에',
    ));

    flagList.add(Flag(
      imagesPath: 'images/estonia.png',
      nationName: '에스토니아',
    ));

    flagList.add(Flag(
      imagesPath: 'images/france.png',
      nationName: '프랑스',
    ));

    flagList.add(Flag(
      imagesPath: 'images/germany.png',
      nationName: '독일',
    ));

    flagList.add(Flag(
      imagesPath: 'images/hungary.png',
      nationName: '헝가리',
    ));

    flagList.add(Flag(
      imagesPath: 'images/italy.png',
      nationName: '이탈리아',
    ));

    flagList.add(Flag(
      imagesPath: 'images/latvia.png',
      nationName: '라트비아',
    ));

    flagList.add(Flag(
      imagesPath: 'images/lithuania.png',
      nationName: '오스트리아',
    ));

    flagList.add(Flag(
      imagesPath: 'images/luxemburg.png',
      nationName: '룩셈부르크',
    ));

    flagList.add(Flag(
      imagesPath: 'images/netherland.png',
      nationName: '네덜란드',
    ));

    flagList.add(Flag(
      imagesPath: 'images/romania.png',
      nationName: '루마니아',
    ));
  }

  //앱 죽을때
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('국가명 맞추기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [FirstPage(list: flagList), SecondPage()],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: TabBar(controller: controller, tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: "List ",
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          ),
        ]),
      ),
    );
  }
}
