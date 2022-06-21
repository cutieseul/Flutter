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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up & Down'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count입니다.',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // body 바깥에 floating 버튼 가능(우측 하단)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              count = 0;
            },
          );
        },
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
