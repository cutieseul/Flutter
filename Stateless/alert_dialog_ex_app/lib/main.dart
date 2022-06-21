import 'package:alert_dialog_app/secondPage.dart';
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
        title: const Text('Alert and Push'),
      ),
      body: Center(
        child: GestureDetector(
          //_로 시작하면 프라이빗
          onTap: () => _showDialog(context),
          child: const Text(
            '두번째 페이지로 이동.',
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
            title: const Text('Page 이동'),
            content: const Text('아래의 버튼을 누르면 페이지 이동함'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    //종료 누르면 창 사라지고 원상복귀
                    Navigator.of(ctx).pop();
                    Navigator.push(
                        ctx,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ));
                  },
                  child: const Text('Page 이동'),
                ),
              ),
            ],
          );
        });
  }
}//end
