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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // property
  // _buttonstate = 전역변수임
  late String _buttonState; //값이 없지만 금방 줄거
  late String _onoff;
  late Color _buttonColor;
  late Color _fontColor;
  @override
  void initState() {
    //변수 만들어주기
    _buttonState = 'OFF';
    _onoff = '버튼 눌러';
    _buttonColor = Colors.red;
    _fontColor = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //전역변수이기 때문에 리턴값 없음
                _onClick();
                _onoffClick();
                _color();
                _fontCol();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_buttonColor),
                  foregroundColor: MaterialStateProperty.all(_fontColor)),
              child: Text(_onoff),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

//----- Function
  _onClick() {
    //setState 써줘야 빌드가 일을 함
    setState(() {
      if (_buttonState == "OFF") {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
    print(_buttonState);
  }

  _onoffClick() {
    setState(() {
      if (_onoff == '버튼 눌러') {
        _onoff = '다시 꺼';
      } else {
        _onoff = '버튼 눌러';
      }
    });
  }

  _color() {
    setState(() {
      if (_buttonColor == Colors.red) {
        _buttonColor = Colors.yellow;
      } else {
        _buttonColor = Colors.red;
      }
    });
  }

  _fontCol() {
    setState(() {
      if (_fontColor == Colors.white) {
        _fontColor = Colors.black;
      } else {
        _fontColor = Colors.white;
      }
    });
  }
}//end
