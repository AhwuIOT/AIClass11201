import 'package:flutter/material.dart';
import 'get_data.dart';

class Table_build extends StatefulWidget {
  Table_build({super.key, required this.data});
  List<String> data;
  @override
  State<Table_build> createState() => _Table_buildState();
}

class _Table_buildState extends State<Table_build> {
  List<String> texts = [];
  @override
  void initState() {
    super.initState();
    texts = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    // 创建表格行
    List<TableRow> rows = [];
    for (int i = 0; i < texts.length; i += 3) {
      List<Widget> cells = [];

      for (int j = 0; j < 3; j++) {
        if (i + j < texts.length) {
          // 如果存在数据，添加到单元格
          cells.add(
            TableCell(
              child: Center(
                child: Text(texts[i + j]),
              ),
            ),
          );
        } else {
          // 如果没有更多数据，添加空单元格以保持表格结构
          cells.add(
            TableCell(
              child: Center(
                child: Text(''),
              ),
            ),
          );
        }
      }

      rows.add(TableRow(children: cells));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(64),
                1: FixedColumnWidth(64),
                2: FixedColumnWidth(64),
              },
              border: TableBorder.all(),
              children: rows,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Return"),
            ),
          ],
        ),
      ),
    );
  }
}
