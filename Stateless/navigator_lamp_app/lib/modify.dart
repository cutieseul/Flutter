import 'package:flutter/material.dart';

import 'package:navigator_lamp_app/message.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  //
  late TextEditingController contentModify;
  late bool onoffSwitch;
  late String onoffButton;

  @override
  void initState() {
    super.initState();
    contentModify = TextEditingController();
    contentModify.text = Message.content;
    onoffSwitch = true;

    if (Message.lampStatus) {
      onoffButton = "On";
      onoffSwitch = true;
    } else {
      onoffButton = "Off";
      onoffSwitch = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(27.0),
              child: TextField(
                controller: contentModify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(onoffButton),
                Switch(
                    value: onoffSwitch,
                    onChanged: (value) {
                      setState(() {
                        onoffSwitch = value;
                        if (onoffSwitch == false) {
                          onoffButton = 'Off';
                        } else {
                          onoffButton = 'On';
                        }
                      });
                    }),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Message.lampStatus = onoffSwitch;
                Message.content = contentModify.text;
                Navigator.pop(context);
              },
              child: const Text('확인'),
            )
          ],
        ),
      ),
    );
  }
}
