import 'dart:async';

import 'package:flutter/material.dart';

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
  // Property
  String displayCharacter = '강가슬짱';
  late String character;
  List str = [];
  late int num;

  @override
  void initState() {
    str = displayCharacter.split('');
    num = 1;
    character = str[0];

    //Timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 전체 색깔을 바꿀때는 scaffold에서 바꿔야된다.
      appBar: AppBar(title: const Text('LED 광고')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            character,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      )),
    );
  }

//--- Functions
  changeImage() {
    setState(() {
      if (num != str.length) {
        character = character + str[num];
        num++;
      } else {
        num = 1;
        character = str[0];
      }
    });
  }
}
