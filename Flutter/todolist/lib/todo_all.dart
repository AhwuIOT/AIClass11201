import 'package:flutter/material.dart';
import 'todo_write.dart';

class TodoAll extends StatefulWidget {
  TodoAll({super.key, required this.tododata});
  String tododata;
  @override
  State<TodoAll> createState() => _TodoAllState();
}

class _TodoAllState extends State<TodoAll> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Checkbox(
                    value: isChanged,
                    onChanged: (value) {
                      setState(() {
                        isChanged = value!;
                        print(isChanged);
                      });
                    },
                  ),
                  title: Text(widget.tododata));
            }));
  }
}
