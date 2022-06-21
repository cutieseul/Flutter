import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  //property
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    //이미지 첫번째에 해당하는 변수 잡아주기
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //첫번째 이미지의 이름 가져오기
              imageName[currentImage],
            ),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 400,
              height: 600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _rihgt();
                    },
                    child: const Text('이전'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _left();
                    },
                    child: const Text('다음'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//-----Function

  _left() {
    setState(() {
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      } else if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    });
  }

  _rihgt() {
    setState(() {
      currentImage -= 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      } //첫페이지에서 오른쪽으로 넘기면 마지막 페이지로 보내기
      else if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    });
  }
}//end