
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:online_casino/storageHelper.dart';
import 'appState.dart';
import 'FirstPage.dart';

class Keno extends StatefulWidget {
  @override
  _KenoState createState() => _KenoState();
}

class _KenoState extends State<Keno> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  int input = 0;
  int input1 = 0;
  int input2 = 0;

  bool check1 = false;
  bool check2 = false;

  int win = 0;

  int currentDiceRoll = 0;
  String choice = "";
  bool isButtonActive = true;
  int checkup = 1;

  List<int> gezogeneZahlen = [];
  List<int> treffer = [];

  List<int> generateFiveRandomNumbers() {
    final random = Random();
    final Set<int> numbers = {};
    while (numbers.length < 5) {
      numbers.add(random.nextInt(70) + 1);
    }
    return numbers.toList();
  }

  int getWinValue() {
    return win;
  }


  void generate() {
    setState(() {
      gezogeneZahlen = generateFiveRandomNumbers();
    });
    setState(() {
      isButtonActive = true;
      StorageHelper.saveCounter();
    });
    final state = AppState();
    state.sharedCounter = state.sharedCounter - input;

    check1 = gezogeneZahlen.contains(input1);
    check2 = gezogeneZahlen.contains(input2);

    if (check1 && check2) {
     setState(() {
       win = 2;
     });
    } else if (check1 || check2) {
      setState(() {
        win = 1;
      });
    } else {
      setState(() {
        win = 0;
      });
    }
  }

  void _submit() {
    setState(() {
      input = int.tryParse(_controller.text) ?? 0;
      input1 = int.tryParse(_controller1.text) ?? 0;
      input2 = int.tryParse(_controller2.text) ?? 0;

      if (input1 < 1 || input1 > 70 || input2 < 1 || input2 > 70) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bitte geben Sie Zahlen zwischen 1 und 70 ein.')),
        );
        return;
      }

      if (input <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bitte geben Sie einen gültigen Einsatz ein.')),
        );
        return;
      }


    });
  }

  Widget printGezogeneZahlen() {
    return Text('Gezogene Zahlen: ${gezogeneZahlen.join(', ')}');
  }

  Widget cashIn() {
    final state = AppState();
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isButtonActive
                  ? () {
                setState(() {
                  if (win == 1) {
                    state.sharedCounter += input * 5;
                  }
                  if (win == 2) {
                    state.sharedCounter += input * 10;
                  }
                  isButtonActive = false;
                  StorageHelper.saveCounter();
                });
              }
                  : null,
              child: const Text('Cash In'),
            ),
          ],
        ));
  }

  Widget inputForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: _controller1,
                      decoration: InputDecoration(labelText: 'Zahl von 1 - 70'),
                    ),
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: _controller2,
                      decoration: InputDecoration(labelText: 'Zahl von 1 - 70'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(labelText: 'Wie viel setzt du?'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submit,
                      child: Text('Submit'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: generate,
                      child: Text('generate'),
                    ),
                    SizedBox(height: 20),
                    printGezogeneZahlen(),
                    cashIn(),
                    Text('Gewinnstufe: ${getWinValue()}')

                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = AppState();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 20,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstPage()),
            );
          },
        ),
        title: const Text('Second Page'),
        actions: <Widget>[
          Icon(Icons.currency_bitcoin),
          Text("${state.sharedCounter}"),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: inputForm(),
      ),
    );
  }
}
