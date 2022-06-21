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
        primarySwatch: Colors.blue, // primarySwatch = 테마
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
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text(
          '대한민국',
        ),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '유비',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '관우',
            ),
            Text(
              '장비',
            ),
          ],
        ),
      ),
    );
  }
}
