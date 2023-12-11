import 'package:flutter/material.dart';
import 'check_box.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  List<String> loginID = ['Ahwu', 'Ahmin', 'Ahhhh'];
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: '你是誰?',
                hintText: '輸入你的號碼',
              ),
              onSubmitted: (value) {
                setState(() {
                  if (loginID.contains(value)) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Check_box(),
                        ));
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            setState(() {
              String texts = _controller.text;
              if (loginID.contains(texts)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Check_box(),
                    ));
              }
            });
          },
          child: Text("Login"),
        )
      ]),
    );
  }
}
