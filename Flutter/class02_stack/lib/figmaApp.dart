import 'package:flutter/material.dart';
import 'dart:ui';

class figmaApp extends StatelessWidget {
  figmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

// 2.获取宽度和高度
    // final screenWidth = mediaQueryData.size.width;
    // final screenHeight = mediaQueryData.size.height;
    // final physicalWidth = window.physicalSize.width;
    // final physicalHeight = window.physicalSize.height;
    final dpr = mediaQueryData.devicePixelRatio;

// 3.状态栏的高度
// 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
// 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    // print('屏幕width:$screenWidth height:$screenHeight');
    // print('分辨率: $physicalWidth * $physicalHeight');
    print('像素比: $dpr');
    // print('状态栏height: $statusBarHeight 底部高度:$bottomHeight');
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
              top: (412 / dpr),
              left: (394 / dpr),
              child: Text(
                "Test",
                style: TextStyle(fontSize: (128 / dpr), color: Colors.white),
              )),
          Positioned(
              width: (500 / dpr),
              height: (500 / dpr),
              top: 550 / dpr,
              left: 332 / dpr,
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Posuere at at consequat pulvinar in.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 40 / dpr,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              )),
          Positioned(
              width: 800 / dpr,
              height: 800 / dpr,
              top: 800 / dpr,
              left: 140 / dpr,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFEC41)),
              )),
          Positioned(
              height: 500 / dpr,
              width: 500 / dpr,
              top: 1417 / dpr,
              left: 521 / dpr,
              child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Posuere at at consequat pulvinar in.",
                  style: TextStyle(
                    color: Color(0xFF924F4F),
                    fontSize: 40 / dpr,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ))),
          Positioned(
            height: 492 / dpr,
            width: 917 / dpr,
            top: 1756 / dpr,
            left: 81 / dpr,
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Integer at sit purus ac. Arcu consequat pellentesque platea sit sem. Quam penatibus quisque platea venenatis neque bibendum. Enim netus mi tincidunt vitae nunc.",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 40 / dpr),
            ),
          )
        ],
      ),
    ));
  }
}
