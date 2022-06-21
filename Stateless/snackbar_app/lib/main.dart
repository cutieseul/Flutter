import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';
import 'package:snackbar_app/snbar.dart';

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
        title: const Text('Snack Bar'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          MySnackBar2(Colors.red),
          MySnackBar2(Colors.purple),
          MySnackBar2(Colors.blue),
          MySnackBar2(Colors.orangeAccent),
          MySnackBar2(Colors.teal)
        ],
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: (){
      //       // ScaffoldMessenger.of(context).showSnackBar(
      //       //   const SnackBar(
      //       //     content: Text('Elevated Button is clicked'),
      //       //     //얼마동안 떠있게 할건지 설정
      //       //     duration: Duration(seconds: 2),
      //       //     backgroundColor: Colors.red,
      //       //   ),
      //       // );
      //       snackBarFuntion(context);
      //     },
      //     child: const Text('Snackbar Buton'),),
      // ),
    );
  }

  //------ Functions
  // 따로 빼놔야 나중에 복사해서 쓸때 편함
  snackBarFuntion(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Elevated Button is clicked'),
        //얼마동안 떠있게 할건지 설정
        duration: Duration(seconds: 1),
        backgroundColor: Colors.blue,
      ),
    );
  }
} //end
