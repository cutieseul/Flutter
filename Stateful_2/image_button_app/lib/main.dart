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
        primarySwatch: Colors.red,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //첫번째 이미지의 이름 가져오기
              imageName[currentImage],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 10,
                        )),
                    child: Image.asset(
                      'images/${imageName[currentImage]}',
                      width: 400,
                      height: 600,
                      // 위에 정해준 대로 꽉 채움
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 290,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.amber,
                      width: 5,
                    )),
                    child: Image.asset(
                      'images/flower_02.png',
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
              ],
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
                    child: const Text('<<  이전'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _left();
                    },
                    child: const Text('다음  >>'),
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
