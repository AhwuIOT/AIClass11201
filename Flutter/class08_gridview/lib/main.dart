import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  final ValueNotifier<List<XFile>?> _imageFiles = ValueNotifier(null);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: const Text('GridView範例'),
    );

    // 建立App的操作畫面
    const items = <String>['第一項', '第二項', '第三項', '第四項', '第五項',
      '第六項', '第七項', '第八項', '第九項',
    ];

    final gridView = GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20.0),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: BouncingScrollPhysics(),
      children: List.generate(items.length,
              (index) {
            final widget = Container(
              child: Text(items[index], style: TextStyle(fontSize: 20),),
              alignment: Alignment.center,
              color: Colors.black12,
            );
            return widget;
          }),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: gridView,
    );

    return appHomePage;
  }
}