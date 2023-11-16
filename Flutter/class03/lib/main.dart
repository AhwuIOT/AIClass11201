import 'package:flutter/material.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
}

//第三個
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//第二個
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//第一個
class _MyHomePageState extends State<MyHomePage> {
  List<String> abc = ['aaa', 'bbb', 'ccc'];
  List<Color> bgcolor = [Colors.black, Colors.pink, Colors.yellow];
  List<Widget> obj_list = [
    Container(
      width: 300,
      height: 300,
      color: Colors.amber,
    ),
    Text(
      "TTT22233",
      style: TextStyle(fontSize: 30),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.amber,
        ),
        Text(
          "TTT22233",
          style: TextStyle(fontSize: 30),
        ),
      ],
    )
  ];
  int i = 0;
  String? abc_text;
  Color? bg;
  Widget? obj;
  void _incrementCounter() {
    setState(() {
      i++;
      int j = i % abc.length;
      abc_text = abc[j];
      bg = bgcolor[j];
      obj = obj_list[j];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            if (abc_text != null)
              Text(
                abc_text!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            if (bg != null)
              Container(
                width: 100,
                height: 100,
                color: bg!,
              ),
            if (obj != null) obj!,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> abc = ['aaa', 'bbb', 'ccc'];
//   int i = 0;

//   void _incrementCounter() {
//     setState(() {
//       // i = (i + 1) % abc.length;
//       if (i < abc.length - 1)
//         i++;
//       else
//         i = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '${abc[i]}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
