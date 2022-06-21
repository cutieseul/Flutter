import 'package:bmi_ex_app/guide.dart';
import 'package:bmi_ex_app/session.dart';
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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController inputH;
  late TextEditingController inputW;
  late TextEditingController bmi;
  late String result;
  late Color resultColor;

  @override
  void initState() {
    inputH = TextEditingController();
    inputW = TextEditingController();
    bmi = TextEditingController();
    result = '';
    resultColor = Colors.blue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // scaffold 어디든 누르면 커서(focus)가 사라진다, 키보드도 사라진다
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: inputH,
                  decoration: InputDecoration(
                    labelText: '키(신장)를 입력하세요.(단위:cm)',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (int.parse(inputH.text) < 100 ||
                        int.parse(inputH.text) > 230) {
                      errorSnackBarH(context);
                    }
                    bmi.text = '';
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text('단위:cm'),
                TextField(
                  controller: inputW,
                  decoration: InputDecoration(
                    labelText: '몸무게(체중)를 입력하세요.(단위:kg)',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (int.parse(inputH.text) < 100 ||
                        int.parse(inputH.text) > 230) {
                      errorSnackBarW(context);
                    }
                    bmi.text = '';
                  },
                ),
                // const Text('단위:kg'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // 사용자의 입력내용 확인, trim(): 띄어쓰기 빼고 받기 위해서
                        if (inputH.text.trim().isEmpty) {
                          errorSnackBarH(context);
                        } else if (inputW.text.trim().isEmpty) {
                          errorSnackBarW(context);
                        } else {
                          bmi.text = (int.parse(inputW.text) /
                                  ((int.parse(inputH.text) / 100) *
                                      (int.parse(inputH.text) / 100)))
                              .toString();
                          setState(() {
                            if (double.parse(bmi.text) > 0 &&
                                double.parse(bmi.text) < 18.5) {
                              result = '저체중';
                              resultColor = Colors.lightGreen;
                              Session.color = resultColor;
                              Session.title = result;
                              Session.guideline = '체성분 및 체형 개선';
                              Session.recommend = '충분한 영양섭취와 근력운동 시작하기';
                            } else if (double.parse(bmi.text) >= 18.5 &&
                                double.parse(bmi.text) < 23) {
                              result = '정상체중';
                              resultColor = Colors.green;
                              Session.color = resultColor;
                              Session.title = result;
                              Session.guideline = '체형 개선';
                              Session.recommend = '좋은 생활 습관 유지하기';
                            } else if (double.parse(bmi.text) >= 23 &&
                                double.parse(bmi.text) < 25) {
                              result = '과체중';
                              resultColor = Colors.green;
                              Session.color = resultColor;
                              Session.title = result;
                              Session.guideline = '체중 조절 및 체형 개선';
                              Session.recommend = '운동량 늘리기';
                            } else if (double.parse(bmi.text) >= 25 &&
                                double.parse(bmi.text) < 30) {
                              result = '비만';
                              resultColor = Colors.orange;
                              Session.color = resultColor;
                              Session.title = result;
                              Session.guideline = '체중 조절';
                              Session.recommend = '영양섭취 줄이기 및 규칙적인 운동 시작하기';
                            } else if (double.parse(bmi.text) >= 30) {
                              result = '고도비만';
                              resultColor = Colors.red;
                              Session.color = resultColor;
                              Session.title = result;
                              Session.guideline = '전문가 상담';
                              Session.recommend = '상담을 통해 생활 전반적으로 밀접한 관리를 받기';
                            }
                          });
                        }
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text('BMI 계산하기'),
                      style: ElevatedButton.styleFrom(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (inputH.text.trim().isEmpty &&
                            inputW.text.trim().isEmpty) {
                          deleteError(context);
                        } else {
                          inputH.text = '';
                          inputW.text = '';
                          bmi.text = '';
                          setState(() {
                            result = '';
                          });
                        }
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('지우기'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: bmi,
                  decoration: const InputDecoration(labelText: 'BMI 값'),
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  // number : 숫자만 입력하는 키보드, 자동으로 안 내려감
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Guide())));
                  },
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 30,
                      backgroundColor: resultColor,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Functions
  errorSnackBarH(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('키를 입력하세요.'),
        duration: Duration(milliseconds: 250),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBarW(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('몸무게를 입력하세요.'),
        duration: Duration(milliseconds: 250),
        backgroundColor: Colors.red,
      ),
    );
  }

  deleteError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('지울 값이 없습니다.'),
        duration: Duration(milliseconds: 250),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Functions
  healthGuide() {
    Session.title = result;
    Session.guideline = '체중조절 보다는 체형개선';
  }
}
