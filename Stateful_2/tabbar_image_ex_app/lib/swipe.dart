import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
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
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
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
                height: 650,
              )
            ],
          ),
        ),
      ),
    );
  }

//-----Function

  _onHorizontalSwipe(SwipeDirection direction) {
    //direction = 방향
    setState(() {
      // 왼쪽으로 스와이프 하면 +1을 해라
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        // 이미지 길이보다 커지면 다시 첫번째 이미지로 보내라
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        //첫페이지에서 오른쪽으로 넘기면 마지막 페이지로 보내기
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;

        if (currentImage >= imageName.length) {
          currentImage = 0;
        } else {
          currentImage -= 1;

          if (currentImage < 0) {
            currentImage = imageName.length - 1;
          }
        }
      }
    });
  }
}//end