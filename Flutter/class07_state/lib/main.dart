import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

// class MainApp extends StatelessWidget {
//   MainApp({super.key});
//   int a = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: MyWidget());
//   }
// }

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          a.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a += 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
