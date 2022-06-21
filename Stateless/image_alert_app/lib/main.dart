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
        primarySwatch: Colors.red,
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
  //property
  late String _onoff;
  late String _lampImage;

  @override
  void initState() {
    // TODO: implement initState
    _lampImage = 'images/lamp_on.png';
    _onoff = 'on';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: 300,
                    height: 400,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _onDialogAlert(context);
                    },
                    child: const Text('켜기'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _offDialogAlert(context);
                    },
                    child: const Text('끄기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //----Function

  // 켜기
  _onDialogAlert(BuildContext context) {
    if (_onoff == 'on') {
      showDialog(
          context: context,
          //종료 눌렀을때만 원상복귀하게 하기, 다른데 터치해도 종료안됨
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 켜진 상태입니다.'),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          //종료 누르면 창 사라지고 원상복귀
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('네.알겠습니다'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
    } else if (_onoff == 'off') {
      setState(() {
        _onoff = 'on';
        _lampImage = 'images/lamp_on.png';
      });
    }
  }

  //----------------------
  // 끄기
  _offDialogAlert(BuildContext context) {
    if (_onoff == 'on') {
      //램프 끌때 alert
      showDialog(
          context: context,
          //종료 눌렀을때만 원상복귀하게 하기, 다른데 터치해도 종료안됨
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('램프끄기'),
              content: const Text('램프를 끄시겠습니까?'),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          //종료 누르면 창 사라지고 원상복귀
                          setState(() {
                            _onoff = 'off';
                            _lampImage = 'images/lamp_off.png';
                            Navigator.of(ctx).pop();
                          });
                        },
                        child: const Text('예'),
                      ),
                      TextButton(
                        onPressed: () {
                          //종료 누르면 창 사라지고 원상복귀
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('아니요'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
    } else if (_onoff == 'off') {
      showDialog(
          context: context,
          //종료 눌렀을때만 원상복귀하게 하기, 다른데 터치해도 종료안됨
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 꺼진 상태입니다.'),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          //종료 누르면 창 사라지고 원상복귀
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('네.알겠습니다'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
    }
  }
}//end