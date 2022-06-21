import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  // Property
  late TextEditingController sepalLengthController;
  late TextEditingController sepalWidthController;
  late TextEditingController petalLengthController;
  late TextEditingController petalWidthController;

  late String sepalLength;
  late String sepalWidth;
  late String petalLength;
  late String petalWidth;
  late String result;

  late List data;
  late String imageAsset;

  @override
  void initState() {
    super.initState();
    sepalLengthController = TextEditingController();
    sepalWidthController = TextEditingController();
    petalLengthController = TextEditingController();
    petalWidthController = TextEditingController();
    data = [];
    imageAsset = 'images/all.jpg';
    result = '';

    sepalLength = '';
    sepalWidth = '';
    petalLength = '';
    petalWidth = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iris 품종 예측"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: sepalLengthController,
                  decoration: const InputDecoration(
                    labelText: 'Sepal Length의 크기를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: sepalWidthController,
                  decoration: const InputDecoration(
                    labelText: 'Sepal Width의 크기를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: petalLengthController,
                  decoration: const InputDecoration(
                    labelText: 'Petal Length의 크기를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: petalWidthController,
                  decoration: const InputDecoration(
                    labelText: 'Petal Width의 크기를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sepalLength = sepalLengthController.text;
                        sepalWidth = sepalWidthController.text;
                        petalLength = petalLengthController.text;
                        petalWidth = petalWidthController.text;
                      });
                      getJSONData();
                    },
                    child: const Text("입력")),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(imageAsset),
                  radius: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> getJSONData() async {
    data.clear();
    var url = Uri.parse(
        "http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth");
    var respons = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(respons.bodyBytes));
      //키값
      result = dataConvertedJSON['result'];
      //데이터에 넣기
      if (result.isEmpty) {
        errorSnackBar(context);
      } else {
        imageAsset = 'images/$result.jpg';
        _showResultDialog(context);
      }
    });

    // print(result);
    return true;
  }

  _showResultDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('품종 예측 결과'),
            content: Text('입력하신 품종은 $result 입니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 입력에 문제가 발생하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
