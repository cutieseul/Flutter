import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:todolist/part_C/UY/list_item.dart';

import '../../message.dart';
import '../../part_B/GS/myPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  late List todolist;
  bool checkValue = false;
  bool trueyo = true;
  bool falseyo = false;
  late String result;
  late String email;
  late String comment;

  late AnimationController _controller;
  late String id;
  late List data = [];

  @override
  void initState() {
    super.initState();
    todolist = [];
    _controller = AnimationController(vsync: this);
    id = Message.userid;
    email = Message.useremail;
    comment = '';

    getJSONData();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO DO LIST",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 164, 154, 239),
        actions: [
          IconButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: todolist.isEmpty
            ? const Text(
                "ToDoList가 비어있습니다. \n\n화면 우측하단의 + 버튼을 눌러 \n\n당신의 ToDoList를 추가하세요.",
                style: TextStyle(fontSize: 20),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Massage.code = data[index]['code'];
                        // Navigator.pushNamed(context, '/1st');

                        setState(() {
                          Navigator.pushNamed(context, '/modify')
                              .then((value) => getJSONData());
                          ListItem.code = todolist[index]['code'];
                          ListItem.content = todolist[index]['content'];
                          Message.userid = todolist[index]['uid'];
                        });
                      },
                      child: Card(
                        color: Colors.deepPurple[50],
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: todolist[index]['check'] == '1'
                                            ? false
                                            : true,
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == true) {
                                              todolist[index]['check'] = '0';
                                              updateCheckboxAction(index);
                                              comment = "Mission Clear ;)";
                                            } else {
                                              todolist[index]['check'] = '1';
                                              updateCheckboxAction(index);
                                              comment = "You Can Do It !";
                                            }
                                          });
                                        },
                                      ),
                                      todolist[index]['check'] == '0'
                                          ? Text(
                                              todolist[index]['content'],
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            )
                                          : Text(
                                              todolist[index]['content'],
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ), //Lb
      ),
      drawer: Drawer(
        child: ListView(
          //패딩 없이 꽉 채우기
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //상단에 이미지 넣기

              //이미지 밑에 이름 & 이메일
              accountName: Text(
                id,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(email, style: const TextStyle(fontSize: 15)),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 164, 154, 239),
                //테두리, 값을 각각 줄 수 있음. all 은 한번에 다 뜸
              ),
            ),

            // 리스트
            ListTile(
              onTap: () {
                setState(() {
                  getJSONDataDrawer();
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) => const MyPage())));
              },
              leading: const Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              title: const Text('My Page'),
            ),

            ListTile(
              onTap: () {
                _showLogoutDialog(context);
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.deepPurple,
              ),
              title: const Text('Log Out'),
            ),
          ],
        ),
      ), //Center,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 164, 154, 239),
        child: const Icon(Icons.add),
        onPressed: () {
          //WritePage로 이동
          Navigator.pushNamed(context, "/write").then((value) => getJSONData());
        },
      ),
    );
  }

  Future<bool> getJSONDataDrawer() async {
    // 비동기 방식 async : 동시에 실행되고
    var url = Uri.parse('http://localhost:8080/Flutter/user_query.jsp');
    var response = await http.get(url);
    // await, build가 data를 기다림
    // get 방식
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    // body 자체로는 decode하지 못한다 : bodyBytes
    List result = dataConvertedJSON['results'];
    // 행렬의 형태로 result에 저장한다. [2,4]

    setState(() {
      data.addAll(result);
    });
    return true;
  }

  Future<bool> getJSONData() async {
    todolist.clear();
    var url = Uri.parse(
        "http://localhost:8080/Flutter/todolist_select_all.jsp?user_uId=$id");

    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results']; //results 키값!

      //   //result[0]['code'] = S001 <- 리스트에 넣어준거 불러오는법
      todolist.addAll(result);
    });

    return true;
  }

  updateCheckboxAction(index) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/todolist_update_checkBox.jsp?check=${todolist[index]['check']}&lCode=${todolist[index]['code']}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    if (result == 'OK') {
      _showDialog(context);
    } else {
      errorSnackBar(context);
    }
  }

  _showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('로그아웃'),
            content: const Text('로그아웃 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('아니오'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Message.userid = '';
                    Message.userpw = '';
                    Message.username = '';
                    Message.useremail = '';
                  });
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('예'),
              ),
            ],
          );
        });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Check Box'),
            content: Text(comment),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}//end
