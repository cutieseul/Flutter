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
      home: const H(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class H extends StatelessWidget {
  const H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('영웅 card'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/Lee.jpg'),
                radius: 60,
              ),
            ),
            Divider(
              height: 50,
              thickness: 3,
            ),
            Text(
              '성웅',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              '이순신장군',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              '전적',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              '62전 62승',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ...['옥포해전', '사천포해전', '당포해전', '한산도대첩', '부산포해전', '명량해전', '노량해전'].map(
              (e) => Row(
                children: [
                  const Icon(Icons.check_circle_outline),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text(e),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Image.asset(
                  'images/turtle.gif',
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
