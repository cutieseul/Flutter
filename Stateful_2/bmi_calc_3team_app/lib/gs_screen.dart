import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI 계산기',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Image.asset(
              'images/bmi.jpg',
              height: 500,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bmi');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(200, 40)),
                child: const Text('BMI 계산하러 가보자고'))
          ],
        ),
      ),
    );
  }
}
