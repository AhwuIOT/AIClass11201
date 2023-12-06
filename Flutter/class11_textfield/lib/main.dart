import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerUp: (_) {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: const MaterialApp(
          home: Scaffold(body: Textfield_example()),
        ));
  }
}

class Textfield_example extends StatefulWidget {
  const Textfield_example({super.key});
  @override
  State<Textfield_example> createState() => _Textfield_exampleState();
}

class _Textfield_exampleState extends State<Textfield_example> {
  TextEditingController controller = TextEditingController();
  // @override
  // void initState() {
  //   super.initState();
  //   // controller.text = "預設文字";
  // }
  String inputText = "";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: controller,
          // keyboardType: TextInputType.number,
          decoration: InputDecoration(prefixIcon: Icon(Icons.done)),
          onChanged: (value) {
            setState(() {
              inputText = value;
            });
          },
        ),
        SizedBox(width: 100),
        Text(inputText)
      ],
    ));
  }
}
