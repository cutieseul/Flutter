import 'package:bmi_app/bmi.dart';
import 'package:bmi_app/screen.dart';
import 'package:flutter/material.dart';

class GsMain extends StatefulWidget {
  const GsMain({Key? key}) : super(key: key);

  @override
  State<GsMain> createState() => _GsMainState();
}

class _GsMainState extends State<GsMain> {
  // Property
  late TextEditingController height;
  late TextEditingController weight;

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  아무데나 터치해도 키보드 내려가게 하기
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/bmi': (context) => const BMI(),
      },
    );
  }
}
