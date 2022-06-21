import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TextButton
            TextButton(
              //한번 터치
              onPressed: () {
                //확인하는 용도 print
                print('Text Button');
              },
              // 길게 꾹 누르기
              onLongPress: () {
                print('Long pressed text button');
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ), //버튼글씨

            //ElevatedButton
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  //라운디드값
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text('Elevated button'),
            ),

            // OutlinedButton
            OutlinedButton(
              onPressed: () {
                //
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(color: Colors.black, width: 2.0),
              ),
              child: const Text(
                'Outlined Button',
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              label: const Text('home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                //버튼 사이즈조절, 글씨에 따라 버튼이 작아질수 있기때문
                minimumSize: const Size(200, 40),
              ), 
            ),
            OutlinedButton.icon(
              onPressed: (){
                //
              }, 
              icon: const Icon(
                Icons.home,
              ), 
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            OutlinedButton.icon(
              onPressed: (){
                //
              }, 
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ), 
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.red[200],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    //
                  }, 
                  child: const Text('TextButton')
                  ),
                ElevatedButton(
                  onPressed: (){
                    //
                  }, 
                  child: const Text('ElevatedButton'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
