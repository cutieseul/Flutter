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
  late int res;

  @override
  void initState() {
    num1 = TextEditingController();
    num2 = TextEditingController();
    res = 0;
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
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('덧셈 결과: $res'),
              TextField(
                controller: num1,
                decoration: const InputDecoration(labelText: '숫자를 입력하세요'),
                //TextInputType.?? 만 쓸거야
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: num2,
                decoration: const InputDecoration(labelText: '숫자를 입력하세요'),
                //TextInputType.?? 만 쓸거야
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    res = int.parse(num1.text) + int.parse(num2.text);
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1000, 50),
                ),
                child: const Text('덧셈계산'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ---- Function

}
