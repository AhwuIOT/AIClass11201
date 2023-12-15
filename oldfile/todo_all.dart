import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_write.dart';

class TodoAll extends StatefulWidget {
  TodoAll({super.key, required this.tododata, this.isChanged});
  List<String> tododata;
  Map<String, bool>? isChanged;
  @override
  State<TodoAll> createState() => _TodoAllState();
}

class _TodoAllState extends State<TodoAll> {
  Future<void> saveCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: widget.tododata.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Checkbox(
                    value: widget.isChanged?[widget.tododata[index]] ?? false,
                    onChanged: (value) {
                      setState(() {
                        widget.isChanged?[widget.tododata[index]] = value!;
                        print("按下checkbox後${widget.isChanged}");
                      });
                    },
                  ),
                  title: Text(widget.tododata[index]));
            }));
  }
}
