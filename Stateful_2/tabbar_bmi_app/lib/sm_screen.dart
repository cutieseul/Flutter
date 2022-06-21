import 'package:textfield_bmi_calc_app/screen1st.dart';

import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('안녕하세요 Pikachu님!'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage() ,));
            },
            icon: const Icon(Icons.calculate),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar( 
                backgroundImage: AssetImage(
                  'images/bmi_image.png',

                  ),
                  radius : 100,
            ),
            const Divider(
              height: 50,
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('BMI 계산하기')
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const UserAccountsDrawerHeader(
              currentAccountPicture: //대표 이미지
              CircleAvatar( 
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage() ,));
              },
              leading: const Icon(
                Icons.calculate,
                color: Colors.green,
              ),
              title: const Text('BMI 계산하기'),
            ),
          ],
        ),
      ),
    );
  }
}