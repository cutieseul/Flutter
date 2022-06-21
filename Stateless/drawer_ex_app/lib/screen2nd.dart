import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
        child: Column(
          children: const [
            Text(
              '유비에게서 온 메일',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '관우에게서 온 메일',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '장비에게서 온 메일',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
