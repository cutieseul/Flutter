import 'package:flutter/material.dart';

class MySnackBar2 extends StatelessWidget {
  final Color myColor;

  const MySnackBar2(this.myColor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Elevated Button is clicked'),
              //얼마동안 떠있게 할건지 설정
              duration: const Duration(seconds: 5),
              backgroundColor: myColor,
            ),
          );
        },
        style: ElevatedButton.styleFrom(primary: myColor),
        child: const Text('Snackbar Buton'),
      ),
    );
  }
}
