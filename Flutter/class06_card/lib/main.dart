import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cards = []; // 儲存Card物件的清單

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView示例'),
      ),
      body: ListView.builder(
        itemCount: cards.length, // 設置清單中的項目數
        itemBuilder: (BuildContext context, int index) {
          return cards[index]; // 返回清單中的每個Card
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 當按下FloatingActionButton時，新增一個Card物件到清單中
          setState(() {
            cards.add(
              Card(
                child: ListTile(
                  title: Text('新的項目'),
                ),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
