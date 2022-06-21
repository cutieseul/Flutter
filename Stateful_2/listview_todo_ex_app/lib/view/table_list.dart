import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/view/detail_list.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // 리스트라고 선언
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    //리스트에 이미지와 글 넣기
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              // .then : 데이터가 갔다가 왔을 때 니가 처리해라는 뜻. 함수만 만들어주면됨
              Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          //데이터 갯수만큼 리스트 생김
          itemCount: todoList.length,
          // position : 인덱스
          itemBuilder: (context, position) {
            //Card: 리스트의 테두리 모양, ; 마지막
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: GestureDetector(
                onTap: () {
                  //클래스 넘겨주기
                  Message.workList = todoList[position].workList;
                  Message.imagePath = todoList[position].imagePath;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailList(),
                      ));
                },
                child: Card(
                  color: position % 2 == 0
                      ? Color.fromARGB(255, 86, 112, 207)
                      : Color.fromARGB(255, 173, 189, 246),
                  child: Row(
                    children: [
                      Image.asset(
                        todoList[position].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        todoList[position].workList,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //---Functions
  rebuildData() {
    setState(() {
      if (Message.action) {
        todoList.add(
            TodoList(imagePath: Message.imagePath, workList: Message.workList));
        Message.action = false;
      }
    });
  }
}
