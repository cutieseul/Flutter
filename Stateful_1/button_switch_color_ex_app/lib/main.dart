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
  late bool switchValue;
  late Color _buttonColor;

  @override
  void initState() {
    switchValue = false;
    _buttonColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _buttonCol();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: Text('Flutter'),
            ),
            Switch(
              // 화면에 있는 스위치(보여주는것) value
              value: switchValue,
              // 사용자가 움직이는 value값
              onChanged: (value) {
                _buttonCol();
              },
            ),
          ],
        ),
      ),
    );
  }

//--- function

  _buttonCol() {
    setState(() {
      if (switchValue == false) {
        switchValue = true;
        _buttonColor = Colors.red;
      } else {
        switchValue = false;
        _buttonColor = Colors.blue;
      }
    });
  }
}// end

