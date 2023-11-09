import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          "第五組",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 40, color: Colors.purple),
        ),
      ),
    );
  }
}
