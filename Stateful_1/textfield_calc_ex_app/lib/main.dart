import 'dart:ui';

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
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController sum;
  late TextEditingController sub;
  late TextEditingController mul;
  late TextEditingController div;

  @override
  void initState() {
    num1 = TextEditingController();
    num2 = TextEditingController();
    sum = TextEditingController();
    sub = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  아무데나 터치해도 키보드 내려가게 하기
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: num1,
                decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                //TextInputType.?? 만 쓸거야
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: num2,
                decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                //TextInputType.?? 만 쓸거야
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          setState(() {
                            sum.text =
                                (int.parse(num1.text) + int.parse(num2.text))
                                    .toString();
                            sub.text =
                                (int.parse(num1.text) - int.parse(num2.text))
                                    .toString();
                            mul.text =
                                (int.parse(num1.text) * int.parse(num2.text))
                                    .toString();
                            div.text =
                                (int.parse(num1.text) / int.parse(num2.text))
                                    .toString();
                          });
                        }
                      },
                      child: const Text('계산하기'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        num1.text = "";
                        num2.text = "";
                        sum.text = "";
                        sub.text = "";
                        mul.text = "";
                        div.text = "";
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: const Text('지우기'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                readOnly: true,
                controller: sum,
                decoration: const InputDecoration(labelText: '덧셈 결과'),
              ),
              TextField(
                readOnly: true,
                controller: sub,
                decoration: const InputDecoration(labelText: '뺄셈 결과'),
              ),
              TextField(
                readOnly: true,
                controller: mul,
                decoration: const InputDecoration(labelText: '곱셈 결과'),
              ),
              TextField(
                readOnly: true,
                controller: div,
                decoration: const InputDecoration(labelText: '나눗셈 결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Function

  // Desc :  텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
