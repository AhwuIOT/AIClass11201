import 'package:flutter/material.dart';

void main() {
  runApp(GridViewList());
}

class GridViewList extends StatefulWidget {
  const GridViewList({super.key});

  @override
  State<GridViewList> createState() => _GridViewListState();
}

class _GridViewListState extends State<GridViewList> {
  List<Widget> grid_list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 每行顯示的列數
              crossAxisSpacing: 2, // 同列之間的間距
              mainAxisSpacing: 10, // 同欄之間的間距
            ),
            itemCount: grid_list.length,
            itemBuilder: ((BuildContext context, int index) {
              return grid_list[index];
            }),
          ),
          floatingActionButton: TextButton(
            onPressed: () {
              setState(() {
                grid_list.add(Card(
                  child: ListTile(
                    title: Text("123"),
                    trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          grid_list.removeAt(0);
                        });
                      },
                      child: Icon(Icons.delete),
                    ),
                  ),
                ));
              });
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
