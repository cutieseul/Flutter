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
  // String displayCharacter = '강가슬짱';
  // List str = [];
  late TextEditingController lulu;
  late String character;
  late int num;

  //띄울 글자

  @override
  void initState() {
    // str = displayCharacter.split('');
    //character = str[0];
    num = 1;
    character = '';
    //띄울 글자
    lulu = TextEditingController();

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
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('광고문구를 입력하세요'),
                  ],
                ),
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    // 왼쪽 밑 동그랗게
                    bottomLeft: Radius.circular(40),
                    // 오른쪽 밑 동그랗게
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: TextField(
                  controller: lulu,
                  decoration: InputDecoration(labelText: '글자를 입력하세요'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('광고문구 생성'))
            ],
          ),
        ),
      ),
    );
  }

//--- Functions
  changeImage() {
    String displayCharacter = lulu.text;
    List str = [];
    str = displayCharacter.split('');
    // character = str[0];
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
