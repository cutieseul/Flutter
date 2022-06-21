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
  //property
  late TextEditingController id;
  late TextEditingController pw;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = TextEditingController();
    pw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 200,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: id,
                    decoration: InputDecoration(labelText: '사용자 ID 입력하세요.'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: pw,
                    decoration: InputDecoration(labelText: '패스워드를 입력하세요'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (id.text.trim().isEmpty || pw.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else if (id.text == 'root' && pw.text == 'qwer1234') {
                      _showDialog(context);
                    } else {
                      idpwError(context);
                    }
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //----
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요!'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  } //

  idpwError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('아이디와 비밀번호가 일치하지 않습니다!!!'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.blue,
      ),
    );
  } //

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('환영합니다!'),
            content: Text('신분이 확인되었습니다.'),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('확인')),
              )
            ],
          );
        });
  }
}//end
