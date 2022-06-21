import 'package:flutter/material.dart';

class SmPage extends StatefulWidget {
  const SmPage({Key? key}) : super(key: key);

  @override
  State<SmPage> createState() => _SmPageState();
}

class _SmPageState extends State<SmPage> {
// Property
  late TextEditingController height;
  late TextEditingController weight;
  late double heigth_bmi;
  late double weigth_bmi;
  late TextEditingController bmi;
  late double result_bmi;
  late TextEditingController result;
 // late bool switchValue_add;
 

  @override
  void initState() {
    
    height = TextEditingController();
    weight = TextEditingController();
    heigth_bmi = 0;
    weigth_bmi = 0;
    bmi = TextEditingController();
    result_bmi = 0;
    result = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '승민이의 BMI 계산기',
              style: TextStyle(
                color: Colors.deepOrange
              ),
            ),
          backgroundColor: Colors.yellow,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: height,
                  decoration: const InputDecoration(labelText: '키(cm)를 입력하세요.'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: weight,
                  decoration: const InputDecoration(labelText: '몸무게(kg)를 입력하세요.'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: (){
                        // 사용자의 입력 내용 확인
                        if(height.text.trim().isEmpty){
                          errorSnackBar1(context);
                        }else if(weight.text.trim().isEmpty){
                          errorSnackBar2(context);
                        }
                        else{
                          _onClick0();
                          setState(() {
                          bmi.text = (((weigth_bmi / (heigth_bmi*heigth_bmi))*10000)).toString();
                          result_bmi = double.parse(bmi.text);
                          print(result_bmi);
                          });
                          _onClick1();
                        }
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text('계산하기'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: (){
                        setState(() {
                          height = TextEditingController();
                          weight = TextEditingController();
                          result_bmi = 0;
                          result = TextEditingController();
                        });
                      },
                      icon: const Icon(Icons.backspace),
                      label: const Text('지우기'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: result,
                  decoration: const InputDecoration(labelText: 'BMI 결과'),
                  keyboardType: TextInputType.number,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text("우리나라 BMI 기준표"),
                    Image.asset(
                      'images/bmi.png',
                      width: 300,
                      height: 400,
                    ),
                  ],
                ),
             ],
           ),
          ),
        ),
      ),
    );
  }

  // -- Functions


  // Desc : 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar1(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('키를 입력해주세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      )
    );
  }
  errorSnackBar2(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('몸무게를 입력해주세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      )
    );
  }

    // -- Functions
  _onClick0(){
    setState(() {
      weigth_bmi = double.parse(weight.text);
      heigth_bmi = double.parse(height.text);
      print(weigth_bmi);
      print(heigth_bmi);
    });
  }
  _onClick1(){
    setState(() {
      if(result_bmi > 30.0){
        result.text = ('귀하는 고도비만입니다. BMI : ${result_bmi}');
      }else if(result_bmi > 25.0){
        result.text = ('귀하는 비만입니다. BMI : ${result_bmi}');
      }else if(result_bmi > 23.0){
        result.text = ('귀하는 과체중입니다. BMI : ${result_bmi}');
      }else if(result_bmi > 18.5){
        result.text = ('귀하는 정상체중입니다. BMI : ${result_bmi}');
      }else{
        result.text = ('귀하는 저체중입니다. BMI : ${result_bmi}');
      }
    });
  }
}

