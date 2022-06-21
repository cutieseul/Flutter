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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // property
  late String _lampImage; // image Name
  late double _lampWidth; // image Width -  바뀌는 값
  late double _lampHeight; // lamp Height
  late bool _switch; //switch status
  late bool _lampSize; // lamp Size Status
  late bool _lampCol;

  @override
  void initState() {
    //첫 화면 구성
    //한번만 실행
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switch = true;
    _lampSize = true;
    _lampCol = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('전구 색깔'),
                    Switch(
                      value: _lampCol,
                      onChanged: (value) {
                        setState(() {
                          _lampCol = value;
                          decisionOnOff();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('전구 확대'),
                    Switch(
                      value: _lampSize,
                      onChanged: (value) {
                        setState(() {
                          _lampSize = value;
                          decisionLampSize();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('전구 스위치'),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                          decisionOnOff();
                        });
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //----Function

  decisionOnOff() {
    if (_switch & _lampCol) {
      _lampImage = 'images/lamp_red.png';
    } else if (_switch & (_lampCol == false)) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

  decisionLampSize() {
    if (_lampSize) {
      _lampWidth = 300;
      _lampHeight = 600;
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
    }
  }
}//end