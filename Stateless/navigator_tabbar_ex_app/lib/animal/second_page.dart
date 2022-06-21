import 'package:flutter/material.dart';

import 'animal_item.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;

  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final nameController = TextEditingController();
  // 라디오 버튼은 group를 쓸 수 있다.
  int _radioValue = 0;
  // 체크박스
  bool flyExist = false;
  var _imagePath; //var 로도 쓸수 있음
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  //순서값
                  value: 0,
                  //그룹
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('양서류'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                    value: flyExist,
                    //check =  변수이름
                    onChanged: (check) {
                      setState(() {
                        flyExist = check!;
                      });
                    })
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/cow.png";
                      setState(() {
                        imageName = "젖소";
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/pig.png";
                      setState(() {
                        imageName = "돼지";
                      });
                    },
                    child: Image.asset(
                      'images/pig.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/bee.png";
                      setState(() {
                        imageName = "벌";
                      });
                    },
                    child: Image.asset(
                      'images/bee.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/cat.png";
                      setState(() {
                        imageName = "고양이";
                      });
                    },
                    child: Image.asset(
                      'images/cat.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/fox.png";
                      setState(() {
                        imageName = "여우";
                      });
                    },
                    child: Image.asset(
                      'images/fox.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/monkey.png";
                      setState(() {
                        imageName = "원숭이";
                      });
                    },
                    child: Image.asset(
                      'images/monkey.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(imageName),
            ),
            ElevatedButton(
                onPressed: () {
                  //main.dart에서 만든 Animal 을 쓰기 위해 변수 만듦
                  var animal = Animal(
                      imagesPath: _imagePath,
                      animalName: nameController.text,
                      kind: getKind(_radioValue),
                      flyExist: flyExist);

                  AlertDialog dialog = AlertDialog(
                    title: const Text('동물 추가하기'),
                    content: Text(
                      '이 동물은 ${animal.animalName} 입니다. \n'
                      '또 동물의 종류는 ${animal.kind} 입니다. \n'
                      '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."} \n'
                      '이 동물을 추가 하시겠습니까?',
                      style: const TextStyle(fontSize: 17),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          widget.list.add(animal);
                          Navigator.of(context).pop();
                        },
                        child: const Text('예'),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            '아니오',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return dialog;
                      });
                },
                child: const Text("동물 추가하기"))
          ],
        ),
      ),
    );
  }

  //-- Functions
  // 라디오 버튼에 디폴트값이 없기 때문에 null값이 있을 수 있기 때문에
  //null safty = ? 써주고 밑에서는 해제 해주기
  // null값이 들어오는 것을 null safety인 ?를 써주고 변환값을 쓸땐 !를 써 빼준다.
  _radioChange(int? value) {
    setState(() {
      //null 값 해제
      _radioValue = value!;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }
}
