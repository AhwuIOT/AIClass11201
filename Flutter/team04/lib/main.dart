import 'dart:math'; // 引入Random
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(
        //  title: const Text('Team4 SliverList 和 SliverGrid'),
        //),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Team4 SliverList 和 SliverGrid'),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  Row(children: [
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.amber,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.black,
                    ),
                  ]),
                ],
              ),
              // child: Image(image: AssetImage('assets/forest.jpg'))
            ),
            // SliverList 示例
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // 生成隨機顏色
                  Color randomColor = _getRandomColor();

                  return ListTile(
                    title: Text('List $index'),
                    tileColor: randomColor,
                  );
                },
                childCount: 10, // 列表中的項目數量
              ),
            ),

            // SliverGrid 示例
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Grid中的列數
                mainAxisSpacing: 8.0, // 行之間的間距
                crossAxisSpacing: 8.0, // 列之間的間距
                childAspectRatio: 1.0, // 每个Grid项的宽高比
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // 生成隨機顏色
                  Color randomColor = _getRandomColor();

                  return Container(
                    color: randomColor,
                    child: Center(
                      child: Text('SliverGrid $index'),
                    ),
                  );
                },
                childCount: 12, // Grid中的項目數量
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 生成隨機顏色的方法
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
