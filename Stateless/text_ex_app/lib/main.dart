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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: const Text(
          'Text Exercise 01'
          ),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            ),
            Text(
              '유비',
            ),
            Text(
              '관우',
            ),
            Text(
              '장비',
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            ),
            Text(
              '조조',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28, //글자크기
                fontWeight: FontWeight.bold, //글자굵기
                letterSpacing: 5, //글자간격
              ),
            ),
            Text(
              '여포',
            ),
            Text(
              '동탁',
            ),
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
