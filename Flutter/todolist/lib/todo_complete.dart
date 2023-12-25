import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';
class todoComplete extends StatefulWidget {
  const todoComplete({
    super.key,
  });

  @override
  State<todoComplete> createState() => _todoCompleteState();
}

class _todoCompleteState extends State<todoComplete> {
  todoTask task = todoTask();
  // Map<String, bool> isChanged = {};
  // List<String> Uncomplete = [];
  // List<String> Complete = [];
  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      task.Complete = prefs.getStringList('Complete') ?? [];
      task.Uncomplete = prefs.getStringList('Uncomplete') ?? [];
      for (int i = 0; i < task.Uncomplete.length; i++) {
        task.isChanged[task.Uncomplete[i]] = prefs.getBool(task.Uncomplete[i]) ?? false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: ListView.builder(
          itemCount: task.Complete.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                task.Complete[index],
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            );
          }),
    );
  }
}