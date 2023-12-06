import 'dart:math';
import 'todo_all.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'todo_write.dart';

//設定主題顏色跟副顏色的地方
ThemeData mainTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.yellow,
      secondary: Colors.white,
    ));

void main() {
  runApp(MyApp());
}

//內容主要分成appbar，body,floatingactionbutton
class MyApp extends StatelessWidget {
  MyApp({super.key, this.data});
  String? data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: mainTheme,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: mainTheme.colorScheme.primary,
            title: Center(
                child: Text(
              "TodoList",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
          //返回的是todo_write裡的todoList這個class的內容
          body: TodoAll(
            tododata: data ?? '',
          ),
          //返回的是todo_write裡的TodoDate這個class的內容
          floatingActionButton: TodoDate(),
        ));
    // floatingActionButton: TodoDateSelect()));
  }
}
