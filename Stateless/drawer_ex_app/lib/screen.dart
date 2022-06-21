import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Mail')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1st');
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2st');
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 버튼 눌렀을때 1st 페이지로 넘어가게 하기
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼 눌렀을때 2st 페이지로 넘어가게 하기
                Navigator.pushNamed(context, '/2st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
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
              //이미지 밑에 이름 & 이메일
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
                Navigator.pushNamed(context, '/1st');
              },
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/2st');
              },
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
