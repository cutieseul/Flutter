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
  late bool _isOn;
  late bool _isSmall;

  @override
  void initState() {
    //첫 화면 구성
    //한번만 실행
    _isOn = true;
    _isSmall = true;
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
                    _isOn ? 'images/lamp_on.png' : 'images/lamp_off.png',
                    width: _isSmall ? 240 : 120,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('전구 확대'),
                    Switch(
                      value: _isSmall,
                      onChanged: (value) {
                        setState(() {
                          _isSmall = !_isSmall;
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
                    const Text('전구 스위치'),
                    Switch(
                      value: _isOn,
                      onChanged: (value) {
                        setState(() {
                          _isOn = !_isOn;
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
}//end