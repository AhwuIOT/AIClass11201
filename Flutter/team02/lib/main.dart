import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Card List Pratice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> itemList = [];
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap Demo: vertical"),
      ),
      body: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.end,
        spacing: 10.0,
        runSpacing: 30.0,
        children: itemList,
      ),
/*      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: const BouncingScrollPhysics(),
        children: itemList,
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          itemList += [_buildItem()];
          itemCount++;
        }),
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem() {
    var theElement;
    return theElement = Container(
      color: Colors.black12,
      child: TextButton(
        child: Text(
          '第$itemCount項',
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: () => setState(() {
          itemList.removeAt(itemList.indexOf(theElement));
          itemList = List.from(itemList);
        }),
      ),
    );
  }
}
