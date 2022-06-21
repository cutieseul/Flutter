import 'package:flutter/material.dart';
import 'package:listview_ex_app/flag.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  //클래스 넘겨주기
                  _showDialog(context, widget.list[position]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagesPath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text("   ${widget.list[position].nationName[0]}_____")
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  //--Functions
  _showDialog(BuildContext context, Flag flag) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('국가명'),
            content: Text("이 동물은 ${flag.nationName} 입니다."),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("종료"),
                  ),
                ],
              )
            ],
          );
        });
  }
}
