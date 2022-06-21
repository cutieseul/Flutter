import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datail View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Message.imagePath),
            const SizedBox(
              height: 20,
            ),
            Text(
                //클래스 가져오기
                Message.workList),
          ],
        ),
      ),
    );
  }
}
