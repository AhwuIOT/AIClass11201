import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table and GridView Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 不會滑動的Table
              Container(
                margin: EdgeInsets.all(16.0),
                child: Table(
                  // defaultColumnWidth: FixedColumnWidth(200), // 固定列寬
                  // defaultColumnWidth: FlexColumnWidth(2.0), //彈性
                  defaultColumnWidth: IntrinsicColumnWidth(), //各別調整
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.fromLTRB(50, 10, 10, 20),
                            color: Colors.blue,
                            child: Center(
                              child: Text('Item 1'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 50,
                            width: 100,
                            padding: EdgeInsets.all(8.0),
                            color: Colors.green,
                            child: Center(
                              child: Text('Item 2'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(8.0),
                            color: Colors.red,
                            child: Center(
                              child: Text('Item 3'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(8.0),
                            color: Colors.red,
                            child: Center(
                              child: Text('Item 3'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 可以滑動的GridView
              Container(
                height: 400, // 調整 GridView 的高度
                margin: EdgeInsets.all(16.0),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20, // 調整 GridView 的 itemCount
                  physics: ScrollPhysics(), // 移除 physics 屬性以允許手指滑動
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.orange,
                      child: Center(
                        child: Text('Grid Item $index'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
