
import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(
            child: ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Elevated Button is clicked'),
                    //얼마동안 떠있게 할건지 설정
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.blue,
                  ),
                );
              }, 
              child: const Text('Snackbar Buton'),),
            
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Elevated Button is clicked'),
                    //얼마동안 떠있게 할건지 설정
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text('Snackbar Buton'),),
            
          ),
       ],
     );
    
  }
}