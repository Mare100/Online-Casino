import 'dart:math';
import 'package:flutter/material.dart';
import 'appState.dart';
import 'package:online_casino/FirstPage.dart';
import 'storageHelper.dart';

final randomizer = Random();

class Keno extends StatefulWidget {
  @override
  _KenoState createState() => _KenoState();
}

class _KenoState extends State<Keno> {

  int number1 =0;
  int number2 =0;
  int number3 =0;
  int number4 =0;
  int number5 =0;

  final TextEditingController _controller = TextEditingController();
  int input = 0;

  final TextEditingController _controller1 = TextEditingController();
  int input1 = 0;

  final TextEditingController _controller2 = TextEditingController();
  int input2 = 0;



void _submit() {
  setState(() {
    input = int.tryParse(_controller.text) ?? 0;
    input1 = int.tryParse(_controller1.text) ?? 0;
    input2 = int.tryParse(_controller2.text) ?? 0;

  });
}


  List<int> generateRandomNumbers() {
    final random = Random();
    final Set<int> numbers = {};

     while (numbers.length < 8) {
      numbers.add(random.nextInt(70) + 1);
     }

    return numbers.toList();
  }



Widget inputForm() {
  return

    Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                SizedBox(
                    width:150,
                    child:
                    Column(children: [
                      TextField(
                        controller: _controller1,
                        decoration: InputDecoration(
                            labelText: 'Zahl von 1 - 70'),
                      ),



                    ])),
                SizedBox(height: 30, width: 30,),
                SizedBox(
                    width: 150,
                    child:
                    Column(children: [
                      TextField(
                        controller: _controller2,
                        decoration: InputDecoration(
                            labelText: 'Zahl von 1 - 70'),
                      ),



                    ])),
                ]),
                SizedBox(height: 30,),
                SizedBox(
                    width: 300,
                    child:
                    Column(children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            labelText: 'Wie viel setzt du?'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Submit'),
                      ),
                      SizedBox(height: 20),
                    ]))
              ],
            ),
          )
        ]
    );
}

@override

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Keno')),
    body: SingleChildScrollView(
      child: inputForm(),
    ),
  );
}
}




