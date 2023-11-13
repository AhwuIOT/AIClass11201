import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.pink,
                width: 100,
                height: 100,
                child: Text("123"),
              ),
            ],
          ),
          Positioned(
            child: Container(
              color: Colors.amber,
              width: 500,
              height: 500,
            ),
            top: 150,
            left: 150,
          ),
          // Positioned(
          //   child: Container(
          //     color: Colors.black,
          //     width: 100,
          //     height: 200,
          //   ),
          //   top: 150,
          // ),
          Positioned(
            child: Text("456"),
            top: 150,
            left: 50,
          )
        ],
      )),
    );
  }
}
