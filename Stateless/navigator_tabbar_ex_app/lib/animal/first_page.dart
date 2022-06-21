import 'package:flutter/material.dart';

import 'animal_item.dart';

class FirstPage extends StatefulWidget {
  //데이터가 생성자를 타고 넘어올 수 있게 list 선언해주기
  final List<Animal> list;
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
            //class 달라서 widget.뫄뫄 라고 써주면 됨 위의 클래스의 list 바로 가져올 수 있음
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
                      Text("      ${widget.list[position].animalName}")
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

//--Functions
  _showDialog(BuildContext context, Animal animal) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(animal.animalName),
            content: Text("이 동물은 ${animal.kind} 입니다."),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('확인')),
              )
            ],
          );
        });
  }
}
