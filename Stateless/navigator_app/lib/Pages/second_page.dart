
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
        // 상단에 그림자 없애기(떠있음정도조절)
        elevation: 0,
      ),
      body: Center(
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
    );
  }
}