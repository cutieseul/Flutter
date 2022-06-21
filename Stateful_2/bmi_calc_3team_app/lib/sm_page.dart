import 'package:bmi_calc_3team_app/sm_bmi.dart';
import 'package:bmi_calc_3team_app/sm_screen.dart';
import 'package:flutter/material.dart';


class SmPage extends StatefulWidget {
  const SmPage({Key? key}) : super(key: key);

  @override
  State<SmPage> createState() => _SmPageState();
}

class _SmPageState extends State<SmPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const Screen(),
        '/1st' : (context) => const SmPage(),
      },
      initialRoute : '/', // 초기화면
    );
  }
}