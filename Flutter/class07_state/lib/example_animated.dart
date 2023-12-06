import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: const Text('ListView範例'),
    );

    var items = <String>[
      '1',
      '2',
      '3',
    ];
    var itemLastNum = items.length;
    final GlobalKey<AnimatedListState> itemMenuKey = GlobalKey();

    final widget = AnimatedList(
        key: itemMenuKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(fontSize: 20),
                ),
                onTap: () {
                  items.add((++itemLastNum).toString());
                  itemMenuKey.currentState?.insertItem(items.length - 1);
                },
                onLongPress: () {
                  var removedItem = items.removeAt(index);
                  var builder = (context, animation) => SizeTransition(
                        sizeFactor: animation,
                        child: ListTile(
                          title: Text(
                            removedItem,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                  itemMenuKey.currentState?.removeItem(index, builder);
                },
              ),
            ));

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}
