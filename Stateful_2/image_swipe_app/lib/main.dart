import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      // 전체 색깔 위에 앱바가 떠있는거라서 이 위치에 전체색깔 지정
      // 앱바는 선택사항임
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
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
                width: 350,
                height: 600,
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
