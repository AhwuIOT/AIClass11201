import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2({super.key, required this.data});
  int data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          data.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
