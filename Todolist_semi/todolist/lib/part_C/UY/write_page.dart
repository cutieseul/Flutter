import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todolist/message.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  late TextEditingController write;
  late String result;
  late String content;
  String uid = Message.userid;

  @override
  void initState() {
    super.initState();
    write = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Write To Do List",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 164, 154, 239),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: write,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "할일을 적어주세요"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (write.text == "") {
                        emptyalert(context);
                      } else {
                        content = write.text;
                        insertAction();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 142, 87, 236),
                    ),
                    child: const Text('확인', style: TextStyle(fontSize: 15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        write.text = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text('리셋', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 164, 154, 239),
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(context, "/list");
        },
      ),
    );
  }

  insertAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/todolist_insert.jsp?content=$content&user_uId=$uid');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    if (result == 'OK') {
      _showDialog(context);
    } else {
      errorSnackBar(context);
    }
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('입력 결과'),
            content: const Text('입력이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(ctx).pop();
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
        content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  emptyalert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('할일을 적어주세요 :) '),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
