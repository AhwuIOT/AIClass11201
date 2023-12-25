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
  MyApp({super.key, this.data, this.isChanged});
  List<String>? data;
  Map<String, bool>? isChanged;

  @override
  Widget build(BuildContext context) {
    // print(data);
    return MaterialApp(
        theme: mainTheme,
        home: FetchData(
          data: data,
          isChanged: isChanged,
        ));
    // floatingActionButton: TodoDateSelect()));
  }
}

class FetchData extends StatefulWidget {
  FetchData({super.key, this.data, this.isChanged});
  List<String>? data;
  Map<String, bool>? isChanged;

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.data = prefs.getStringList('Uncomplete') ?? [];
      // print("123${widget.isChanged}");
    });
    // await Future.delayed(Duration(seconds: 10));
    widget.data?.forEach((element) {
      print(element);
      widget.isChanged?[element] = prefs.getBool(element) ?? false;
    });
    print("main :${widget.data}");
    print("main isCheck:${widget.isChanged}");
  }

  Future<void> Reset_btn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('Uncomplete', []);
  }

  @override
  void initState() {
    super.initState();
    loadData();
    // print();
    // print("main裡的${widget.data}");
    // print("在main的時候ischanged的值${widget.isChanged}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              Reset_btn();
            });
          },
        ),
        backgroundColor: mainTheme.colorScheme.primary,
        title: Center(
            child: Text(
          "TodoList",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        )),
      ),
      //返回的是todo_write裡的todoList這個class的內容
      body: TodoAll(
        tododata: widget.data ?? [],
        isChanged: widget.isChanged,
      ),
      //返回的是todo_write裡的TodoDate這個class的內容
      floatingActionButton: TodoDate(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
