
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pikachu_2'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'images/pikachu-2.jpg',
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
                backgroundColor: MaterialStateProperty.all(Colors.red)
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