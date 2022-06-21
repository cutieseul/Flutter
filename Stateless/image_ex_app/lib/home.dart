

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Padding'),
      ),
      body: Center(
        child: Image.asset(
          'images/smile.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}