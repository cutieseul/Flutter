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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          //_로 시작하면 프라이빗
          onTap: () => _showDialog(context),
          child: const Text(
            'Hello World',
          ),
        ),
      ),
    );
  }

  //-------- Functions
  _showDialog(BuildContext context) {
    //복원할때 어떻게 할거냐
    showDialog(
        context: context,
        //종료 눌렀을때만 원상복귀하게 하기, 다른데 터치해도 종료안됨
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Alert Title'),
            content: const Text('Hello World를\n Touch 했습니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    //종료 누르면 창 사라지고 원상복귀
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('종료'),
                ),
              ),
            ],
          );
        });
  }
}//end
