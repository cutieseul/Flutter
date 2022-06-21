import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';
import 'package:navigator_lamp_app/modify.dart';

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
  //property
  late String _lampImage;
  late TextEditingController content;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    content = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Message.content = content.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ModifyPage();
                }),
              ).then((value) => contentUse());
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: content,
                decoration: const InputDecoration(labelText: '글자를 입력하세요.'),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              _lampImage,
              width: 150,
              height: 200,
            )
          ],
        ),
      ),
    );
  }

  //----
  contentUse() {
    setState(() {
      content.text = Message.content;
      if (Message.lampStatus == true) {
        _lampImage = 'images/lamp_on.png';
      } else {
        _lampImage = 'images/lamp_off.png';
      }
    });
  }
}
