import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(15, (i) => 'Item $i'),
    ),
  );
}

class MyApp extends StatelessWidget {
  List<String> items = [];

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            Icon leadingIcon;
            if (index < 5) {
              leadingIcon = Icon(Icons.map);
            } else if (index < 10) {
              leadingIcon = Icon(Icons.album);
            } else {
              leadingIcon = Icon(Icons.phone);
            }

            return Card();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
