
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pikachu_1'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'images/pikachu-1.jpg',
              width: 200,
              height: 200,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                // 위에 페이지 사라지게 하기
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
              child: const Text(
                'Go to the first Page',
              ),
              ),
          ),
        ],
      ),
    );
  }
}