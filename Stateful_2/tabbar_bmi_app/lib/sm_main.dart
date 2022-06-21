import 'package:flutter/material.dart';
import 'package:textfield_bmi_calc_app/screen.dart';
import 'package:textfield_bmi_calc_app/screen1st.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const Screen(),
        '/1st' : (context) => const MyHomePage(),
      },
      initialRoute : '/', // 초기화면
    );
  }
}