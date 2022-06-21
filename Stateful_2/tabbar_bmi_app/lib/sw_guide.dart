import 'package:bmi_ex_app/session.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Session.color,
        title: Text(
          Session.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              Session.title,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Session.color,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              height: 10,
              thickness: 1.5,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '목표',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Session.guideline,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '가이드라인',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Session.recommend,
            ),
          ],
        )),
      ),
    );
  }
}
