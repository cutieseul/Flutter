import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2st'),
      ),
      body: Center(
        child: Text(
          'Screen 2st',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
