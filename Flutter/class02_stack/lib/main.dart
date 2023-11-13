import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

// 2.获取宽度和高度
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    final dpr = window.devicePixelRatio;

// 3.状态栏的高度
// 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
// 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    print('屏幕width:$screenWidth height:$screenHeight');
    print('分辨率: $physicalWidth * $physicalHeight');
    print('像素比: $dpr');
    print('状态栏height: $statusBarHeight 底部高度:$bottomHeight');
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1080,
            height: 2400,
            color: Colors.black,
          ),
          Positioned(
              top: 157,
              left: 150,
              child: Text(
                "Test",
                style: TextStyle(fontSize: 48, color: Colors.white),
              )),
          Positioned(
              width: 190,
              height: 190,
              top: 209,
              left: 126,
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Posuere at at consequat pulvinar in.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15.238,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              )),
          Positioned(
              width: 304,
              height: 304,
              top: 304.76,
              left: 53.3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFEC41)),
              )),
          Positioned(
              height: 190.47,
              width: 190.47,
              top: 539.809,
              left: 198.476,
              child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Posuere at at consequat pulvinar in.",
                  style: TextStyle(
                    color: Color(0xFF924F4F),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ))),
          Positioned(
            height: 187.428,
            width: 349.33,
            top: 668.952,
            left: 30.857,
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Integer at sit purus ac. Arcu consequat pellentesque platea sit sem. Quam penatibus quisque platea venenatis neque bibendum. Enim netus mi tincidunt vitae nunc.",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 15.238),
            ),
          )
        ],
      ),
    ));
  }
}
