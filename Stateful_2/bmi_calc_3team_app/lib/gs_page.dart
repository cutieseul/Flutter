import 'package:bmi_calc_3team_app/gs_bmi.dart';
import 'package:bmi_calc_3team_app/gs_screen.dart';
import 'package:flutter/material.dart';

class GsPage extends StatefulWidget {
  const GsPage({Key? key}) : super(key: key);

  @override
  State<GsPage> createState() => _GsPageState();
}

class _GsPageState extends State<GsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/bmi': (context) => const BMI(),
      },
    );
  }
}
