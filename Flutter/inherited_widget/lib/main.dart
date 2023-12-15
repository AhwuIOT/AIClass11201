import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: CounterInheritedWidget(count: count,
              child: Builder(builder:(BuildContext context){return TestContainer(value: CounterInheritedWidget.of(context)!.count);}),

              
            ),
            
      ),Center(child: Text("不使用:$count"),)
          ],
        ),floatingActionButton: FloatingActionButton(onPressed: ()=>count+=1,child:Icon(Icons.add)),),
    );
  }
}



class CounterInheritedWidget extends InheritedWidget {
  CounterInheritedWidget({required this.count, required child,Key?key})
      : super(child: child);

  // 共享的資料，計數的值
  final int count;

  // 獲取CounterInheritedWidget實例的方法, 方便widget樹中的子widget獲取共享的資料
  // 必須在State中調用才會有效
  static CounterInheritedWidget ?of(BuildContext context) {
    // 調用共享數據的子widget將不會回調didChangeDependencies方法，即子widget將不會更新
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  // 決定是否通知樹中有依賴共享數據的子widget (true 就通知)
  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.count != count;
  }
  

}

class TestContainer extends StatelessWidget {
  TestContainer({super.key, required this.value});
  int value;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("使用Inherited:${value.toString()}",style: TextStyle(fontSize:30),),);
  }
}