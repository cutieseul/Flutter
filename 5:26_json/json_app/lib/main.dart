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
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Column(
                        children: ['Code', 'Name', 'Dept', 'Phone']
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      e,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data[index][e.toLowerCase()],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                }),
      ),
    );
  }

  // ---Functon
  // async : 비동기 방식으로 만들기, 같이 돌아가게 만듦.
  Future<bool> getJSONData() async {
    var url =
        Uri.parse("http://localhost:8080/Flutter/student_query_flutter.jsp");
    var respons = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(respons.bodyBytes));
      //키값
      List result = dataConvertedJSON['results'];
      //데이터에 넣기
      data.addAll(result);
    });

    // print(data[0]['code']);

    // print(respons.body);
    // print(result);
    return true;
  }
}//