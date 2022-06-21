import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  //property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert & return for CRUD'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: '학번을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '성명을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호를 입력하세요.',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;
                  insertAction();
                },
                child: const Text('입력'))
          ],
        ),
      ),
    );
  }

  //----
  insertAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];

      if (result == 'OK') {
        _showDialog(context);
      } else {
        errorSnackBar(context);
      }
    });

    
  }

  _showDialog(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('입력결과'),
            content: const Text('입력이 완료되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
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
}//
