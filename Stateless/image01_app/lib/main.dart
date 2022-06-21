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
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Image 01'),
        backgroundColor: Colors.red,
      ) ,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  radius: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

