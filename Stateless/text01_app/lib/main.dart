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
        title: const Text(
          "text01_app"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "James"
                ),
                SizedBox(
                  width : 20,
                ),
                Text(
                  "Cathy"
                ),
                SizedBox(
                  width : 20,
                ),
                Text(
                  "Kenny"
                ),
              ],
          ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "James"
              ),
              SizedBox(
                width : 20,
              ),
              Text(
                "Cathy"
              ),
              SizedBox(
                width : 20,
              ),
              Text(
                "Kenny"
              ),
            ],
          ),
          ]
        )
      ),
    );
  }
}