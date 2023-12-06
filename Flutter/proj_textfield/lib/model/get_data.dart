import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'build_table.dart';

class Textfield_example extends StatefulWidget {
  Textfield_example({super.key});

  @override
  State<Textfield_example> createState() => _Textfield_exampleState();
}

class _Textfield_exampleState extends State<Textfield_example> {
  TextEditingController controller = TextEditingController();
  List<String> inputText = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: '輸入數值',
              labelStyle: TextStyle(fontSize: 20),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // decoration: InputDecoration(prefixIcon: Icon(Icons.done)),
          ),
          ElevatedButton(
              onPressed: () {
                inputText = [];
              },
              child: Text(
                "清空數值",
                style: TextStyle(fontSize: 30),
              )),
          ElevatedButton(
              onPressed: () {
                inputText.add(controller.text);
                print("我們裡面的值" + inputText.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Table_build(
                              data: inputText,
                            )));
                controller.text = '';
              },
              child: Text(
                "OK",
                style: TextStyle(fontSize: 30),
              ))
        ],
      )),
    );
  }
}
