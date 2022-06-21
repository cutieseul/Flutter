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
      home: const H(),
    );
  }
}

class H extends StatelessWidget {
  const H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      appBar: AppBar(
        title: Text('Image Ex01'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // row에 1개 들어갈 땐 row로 씌우지 않는게 퍼포먼스에 도움이 된다.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  radius: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-2.jpg'),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-3.jpg'),
                    radius: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
