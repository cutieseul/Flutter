import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          //패딩 없이 꽉 채우기
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              //상단에 이미지 넣기
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('Pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                //테두리, 값을 각각 줄 수 있음. all 은 한번에 다 뜸
                borderRadius: BorderRadius.only(
                  // 왼쪽 밑 동그랗게
                  bottomLeft: Radius.circular(40),
                  // 오른쪽 밑 동그랗게
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),

            // 리스트
            ListTile(
              onTap: () {
                //터치 했을때 이동
              },
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              trailing: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
