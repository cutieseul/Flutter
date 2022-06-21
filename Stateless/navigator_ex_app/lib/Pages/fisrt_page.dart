import 'package:flutter/material.dart';
import 'package:navigator_ex_app/Pages/second_page.dart';
import 'package:navigator_ex_app/Pages/third_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const SecondPage();
                },));
              }, 
              child: const Text(
                'pikachu_1',
              ),
              ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ThirdPage();
                },));
              },
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
              child: const Text(
                'pikachu_2',
              ),
              ),
          ),
        ],
      ),
    );
  }
}