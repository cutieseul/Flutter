import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
// Property
  late TextEditingController height;
  late TextEditingController weight;
  late double result;
  late String imageName;

  @override
  void initState() {
    height = TextEditingController()
      ..addListener(() {
        _calc();
      });
    weight = TextEditingController()
      ..addListener(() {
        _calc();
      });
    imageName = 'bmi.jpg';
    result = 0;
    super.initState();
  }

  void _calc() {
    setState(() {
      if (height.text.trim().isEmpty | weight.text.trim().isEmpty) {
        imageName = 'bmi.jpg';
      } else {
        double result = (int.parse(weight.text.trim()) /
            (int.parse(height.text.trim()) *
                int.parse(height.text.trim()) /
                10000));
        if (result < 18.5) {
          imageName = '1.png';
        } else if (result < 24.5) {
          imageName = '2.png';
        } else if (result < 30 && result > 25) {
          imageName = '3.png';
        } else if (result < 39.5 && result > 35) {
          imageName = '4.png';
        } else if (result < 44.5 && result > 40) {
          imageName = '5.png';
        } else {
          imageName = '6.png';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('BMI 계산하기'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '신장',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: height,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            '몸무게',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: weight,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'kg',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (imageName == 'bmi.jpg') ...[
                      Image.asset('images/$imageName')
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/$imageName',
                            width: 180,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '당신의 BMI',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '${(int.parse(weight.text.trim()) / (int.parse(height.text.trim()) * int.parse(height.text.trim()) / 100000)).round() / 10}',
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
// ---- Function

  // Desc :  텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}//end

