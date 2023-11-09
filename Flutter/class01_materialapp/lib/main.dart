import 'package:flutter/material.dart';
import 'materialapp.dart';
import 'rows.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
        // double maxdisp = constraints.maxWidth / 5.0;
        return Expanded(child: myrow());
      })),
    ));
  }
}
// var hiflutter = Text(
//   "hi, flutter",
//   style: TextStyle(fontSize: 40),
// );

// var appBody = Center(
//   child: hiflutter,
// );

// var appBar = AppBar(title: Text("456"));
