import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1st');
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2st');
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
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
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼 눌렀을때 2st 페이지로 넘어가게 하기
                Navigator.pushNamed(context, '/2st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
