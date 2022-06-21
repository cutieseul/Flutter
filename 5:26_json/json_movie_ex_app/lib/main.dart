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
        title: const Text('JSON Movie'),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: (data.length / 2).floor(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Colors.red[50],
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              data[index * 2]['image'],
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              data[index * 2]['title'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    side: BorderSide(
                                      width: 5,
                                      color: Color.fromARGB(255, 198, 155, 205),
                                    )),
                                color: Colors.red[50],
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              data[index * 2 + 1]['image'],
                                              width: 150,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              data[index * 2 + 1]['title'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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
    var url = Uri.parse("https://zeushahn.github.io/Test/movies.json");
    var respons = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(respons.bodyBytes));
      //키값
      List result = dataConvertedJSON['results'];
      //데이터에 넣기
      data.addAll(result);
    });

    print(data[0]['code']);

    // print(respons.body);
    // print(result);
    return true;
  }
}//