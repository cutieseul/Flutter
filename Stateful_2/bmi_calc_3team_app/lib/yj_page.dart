import 'package:flutter/material.dart';

class YjPage extends StatefulWidget {
  const YjPage({Key? key}) : super(key: key);

  @override
  State<YjPage> createState() => _YjPageState();
}

class _YjPageState extends State<YjPage> {
  late TextEditingController height;
  late TextEditingController weight;
  late TextEditingController result;
  late TextEditingController resultment;
  late TextEditingController ment;
  late bool switchValue1;

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    result = TextEditingController();
    resultment = TextEditingController();
    ment = TextEditingController();
    switchValue1 = false;
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
          title: const Text('BMI 계산하기'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                    width: 20,
                  ),
                  TextField(
                    controller: height,
                    decoration: const InputDecoration(
                      labelText: '키',
                      hintText: 'Cm 단위로 키를 입력하세요.',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: weight,
                    decoration: const InputDecoration(
                      labelText: '몸무게',
                      hintText: 'Kg 단위로 몸무게를 입력하세요.',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (height.text.trim().isEmpty ||
                              weight.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            result.text = (double.parse(weight.text) /
                                    double.parse(height.text) /
                                    double.parse(height.text) *
                                    10000)
                                .toStringAsFixed(2);
                          }
                          if (height.text.trim().isEmpty ||
                              weight.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              16) {
                            resultment.text = '숫자를 제대로 ! 입력해 주세요';
                            ment.text = '눈 좀 뜨고 숫자 제대로 입력해줘';
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              18.4) {
                            resultment.text = '당신은 저체중 입니다.';
                            ment.text = '가리지 말고 좀 먹어';
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              22.9) {
                            resultment.text = '당신은 정상체중 입니다.';
                            ment.text = '지극히 평범. 이대로 살으렴';
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              24.9) {
                            resultment.text = '당신은 과체중 입니다.';
                            ment.text = '살 좀 찌고 있는데? 긴장 좀 하지';
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              29.9) {
                            resultment.text = '당신은 비만 입니다.';
                            ment.text = '살 빼는게 좋을거 같은데';
                          } else if ((double.parse(weight.text) /
                                  double.parse(height.text) /
                                  double.parse(height.text) *
                                  10000) <
                              36.0) {
                            resultment.text = '당신은 고도비만 입니다.';
                            ment.text = '넌 살 빼야해';
                          } else {
                            resultment.text = '숫자를 제대로 ! 입력해 주세요';
                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('계산'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          height.text = '';
                          weight.text = '';
                          result.text = '';
                          resultment.text = '';
                          ment.text = '';
                        },
                        icon: const Icon(Icons.autorenew),
                        label: const Text('삭제'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  // TextField(
                  //   controller: result,
                  //   decoration: const InputDecoration(labelText: '신체질량지수'),
                  //   readOnly: true,
                  // ),
                  TextFormField(
                    controller: result,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calculate_rounded),
                        suffixText: '신체질량지수',
                        hintText: '당신의 BMI 지수는 ?'),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  // TextField(

                  //   controller: resultment,

                  //   decoration: const InputDecoration(labelText: '현재상태'),
                  //   readOnly: true,
                  // ),
                  TextFormField(
                    controller: resultment,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        suffixText: '현재상태',
                        hintText: '당신은 현재 어떤 상태 ?'),
                    readOnly: true,
                  ),
                  Row(
                    children: [
                      const Text(
                        '충고 들을 자신이 있다면? -> 클릭',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Switch(
                        value: switchValue1,
                        onChanged: (value1) {
                          setState(() {
                            switchValue1 = value1;
                            if (switchValue1 == false) {
                              ment.text = '';
                            } else {
                              //ment.text
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/smile.png'),
                ),
                accountName: Text('BMI 는 체중(kg)/신장(m)*신장(m) 이야'),
                accountEmail: Text(
                  '기준을 한 번 살펴볼까 ?',
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.grey,
                textColor: Colors.red,
                focusColor: Colors.blue,
                onTap: () {},
                leading: const Icon(
                  Icons.check,
                  color: Colors.red,
                ),
                title: const Text('분류기준'),
              ),
              const ListTile(
                title: Text('분류                BMI'),
                tileColor: Colors.red,
              ),
              const ListTile(
                title: Text('저체중    :     00.0 ~ 18.4\n과체중'),
                tileColor: Colors.orange,
              ),
              const ListTile(
                title: Text('정상       :     18.5 ~ 22.9'),
                tileColor: Colors.yellow,
              ),
              const ListTile(
                title: Text('과체중    :     23.0 ~ 24.9'),
                tileColor: Colors.green,
              ),
              const ListTile(
                title: Text('비만       :      25.0 ~ 29.9'),
                tileColor: Colors.blue,
              ),
              const ListTile(
                title: Text('고도비만 :      30.0 ~     '),
                tileColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Desc : 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }
}
