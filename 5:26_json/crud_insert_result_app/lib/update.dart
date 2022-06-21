
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Update extends StatefulWidget {
  final String code;
  final String name;
  final String dept;
  final String phone;
  
  const Update({Key? key, required this.code, required this.name, required this.dept, required this.phone}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  //property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  late String result;

  late String code;
  late String name;
  late String dept;
  late String phone;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    codeController.text = widget.code;
    nameController.text = widget.name;
    deptController.text = widget.dept;
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for CRUD'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: codeController,
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: deptController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: phoneController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;
                  updateAction();
                },
                child: const Text('수정'),),
          ],
        ),
      ),
    );
  }
  
  //---
//----
  updateAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_update_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
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
            title: const Text('수정결과'),
            content: const Text('수정이 완료되었습니다'),
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
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
}//