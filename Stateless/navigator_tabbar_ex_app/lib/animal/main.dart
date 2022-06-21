import 'package:flutter/material.dart';

import 'animal_item.dart';
import 'first_page.dart';
import 'second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //property
  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        imagesPath: 'images/bee.png',
        animalName: '벌',
        kind: '곤충',
        flyExist: true));

    animalList.add(Animal(
        imagesPath: 'images/cat.png',
        animalName: '고양이',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/cow.png',
        animalName: '젖소',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/dog.png',
        animalName: '강아지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/fox.png',
        animalName: '여우',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/monkey.png',
        animalName: '원숭이',
        kind: '영장류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/pig.png',
        animalName: '돼지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagesPath: 'images/wolf.png',
        animalName: '늑대',
        kind: '포유류',
        flyExist: false));
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
        title: const Text('Animal List'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: TabBar(controller: controller, tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
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
