import 'package:bmi_app/name.dart';
import 'package:flutter/material.dart';


class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _HomeState();
}

class _HomeState extends State<ThirdPage> {
  late TextEditingController textEditingController;
  late TextEditingController textEditingController2;

  late TextEditingController retextEditingController1;
  late TextEditingController retextEditingController2;
  late TextEditingController retextEditingController3;
  late TextEditingController retextEditingController4;

  late String result1;
  late String result2;
  late String result3;
  late String result4;


  late bool switchValue1;
  late bool switchValue2;
  late bool switchValue3;
  late bool switchValue4;

  late String normal;
  late String normalkg;
  late double bmi;
  late String image;
  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController2 = TextEditingController();

    retextEditingController1 = TextEditingController();
    retextEditingController2 = TextEditingController();
    retextEditingController3 = TextEditingController();
    retextEditingController4 = TextEditingController();

    result1 = '';
    result2 = '';
    result3 = '';
    result4 = '';
    normalkg = '';
    normal = '';
    bmi = 0;

    image = 'images/pikachu-1.jpg';

    switchValue1 = true;
    switchValue2 = true;
    switchValue3 = true;
    switchValue4 = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('국제(WHO) 기준 BMI 계산 '),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(labelText: '키(cm)를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(labelText: '몸무게(kg)를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // 사용자의 입력 내용 확인
                          if (textEditingController.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            showSnackBar(context);
                          }
                        },
                        child: const Text('계산하기')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // 사용자의 입력 내용 확인
                          setState(() {
                            textEditingController.text = '';
                            textEditingController2.text = '';
                            retextEditingController1.text = '';
                            retextEditingController2.text = '';
                            retextEditingController3.text = '';
                            retextEditingController4.text = '';
                          });
                        },
                        child: const Text('리셋'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: retextEditingController1,
                  decoration: const InputDecoration(labelText: 'BMI 결과'),
                  keyboardType: TextInputType.number,
                  readOnly: true,
                ),
                Text(normal),
                Image.asset(
          image,
          width: 300,
          height: 300,
        )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -- function
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  showSnackBar(BuildContext context) {
    int firstNum = int.parse(textEditingController.text);
    int SecondNum = int.parse(textEditingController2.text);

    setState(() {
      bmi = SecondNum / ((firstNum/100)*(firstNum/100));
      if(bmi >=40){
          result1 = "고도비만 입니다.";
          image = 'images/pikachu-2.jpg';
      }else if(bmi >=30){
        result1 = "비만 입니다.";
        
      }else if(bmi >=25){
        result1 = "과체중 입니다.";
      }else if(bmi >=18.5){
        result1 = "정상체중 입니다.";
      }else{
        result1 = "저체중 입니다.";
      }
      
      retextEditingController1.text = result1;

      
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('계산완료'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
}
