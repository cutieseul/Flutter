import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool buySwitch;
  late bool prSwitch;
  late bool studySwitch;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    buySwitch = true;
    prSwitch = false;
    studySwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('구매'),
                  Switch(
                      value: buySwitch,
                      onChanged: (value) {
                        setState(() {
                          buySwitch = value;
                          if (value) {
                            prSwitch = false;
                            studySwitch = false;
                          } else {
                            buySwitch = true;
                          }
                        });
                      }),
                  Image.asset('images/cart.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('약속'),
                  Switch(
                      value: prSwitch,
                      onChanged: (value) {
                        setState(() {
                          prSwitch = value;
                          if (value) {
                            buySwitch = false;
                            studySwitch = false;
                          } else {
                            buySwitch = true;
                          }
                        });
                      }),
                  Image.asset('images/clock.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('스터디'),
                  Switch(
                      value: studySwitch,
                      onChanged: (value) {
                        setState(() {
                          studySwitch = value;
                          if (value) {
                            buySwitch = false;
                            prSwitch = false;
                          } else {
                            buySwitch = true;
                          }
                        });
                      }),
                  Image.asset('images/pencil.png'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력 하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  //isNotEmpty: 뭔가 적혀있으면
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-------Functions
  addList() {
    if (buySwitch) {
      Message.imagePath = 'images/cart.png';
    } else if (prSwitch) {
      Message.imagePath = 'images/clock.png';
    } else {
      Message.imagePath = 'images/pencil.png';
    }
    Message.workList = textEditingController.text;
    Message.action = true;
  }
}//
