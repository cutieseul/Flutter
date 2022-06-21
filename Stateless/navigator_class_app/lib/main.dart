import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/1st': (context) => const Screen1st(), //fat arrow
        //function
        '/2st': (context) {
          return const Screen2nd();
        }
      },
      initialRoute: '/',
    );
  }
}
