import 'package:flutter/material.dart';
import 'check_box.dart';
import 'login.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 250, 185, 124),
          useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('手機歸還CheckList'),
        ),
        body: Center(
          child: loginPage(),
        ),
      ),
    );
  }
}
