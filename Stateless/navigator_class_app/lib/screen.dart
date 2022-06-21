import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 버튼 눌렀을때 1st 페이지로 넘어가게 하기
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Go to the screen #1'),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼 눌렀을때 2st 페이지로 넘어가게 하기
                Navigator.pushNamed(context, '/2st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange)),
              child: const Text('Go to the screen #2'),
            ),
          ],
        ),
      ),
    );
  }
}
