
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:online_casino/storageHelper.dart';
import 'appState.dart';
import 'FirstPage.dart';

class Roulette extends StatefulWidget {
  @override
  _RouletteState createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  int currentDiceRoll = 0;
  String choice = "";
  bool isButtonActive = false;
  bool isSpin = false;
  int checkup = 1;


  final StreamController<int> selected = StreamController<int>();
  final List<String> items = [
    '0',
    '1',
    '0',
    '1',
    '0',
    '1',
    '0',
    '1',
  ];

  final TextEditingController _controller = TextEditingController();
  int input = 0;

  void _submit() {
    setState(() {
      input = int.tryParse(_controller.text) ?? 0;
    });
  }

  String? selectedName;
  bool isSpinning = false;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _setCheckup_0() { //Verhindert dass die gewählte Zahl nach dem Würfeln nochmal gewexchselt werden kann
    setState(() {
      checkup = 0;
    });
  }
  void _setCheckup_1() {
    setState(() {
      checkup = 1;
    });
  }

  int color1 = 0;
  int color2 = 0;


  Widget chooseColor() {
    return
      Column(children: [
        Text("Wähle eine Farbe auf die du dein Geld setzt"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:  BoxDecoration(
                  border: Border.all(color: Color(color1))
              ),
              child:IconButton(
                iconSize: 50,
                icon: Icon(Icons.circle, color: Color(0xFFd0cae4),),
                onPressed: () {
                  _setChoice("0");
                  color1 = 0xFF000000;
                  color2 =0;
                  _setCheckup_0();
                },
              ),
            ),
            Container(
              decoration:  BoxDecoration(
                  border: Border.all(color: Color(color2))
              ),
              child:IconButton(
                iconSize: 50,
                icon: Icon(Icons.circle, color: Color(0xFF6450a6),),
                onPressed: () {
                  _setChoice("1");
                  color2 = 0xFF000000;
                  color1 =0;
                  _setCheckup_0();
                },
              ),
            ),

          ],
        ),

      ],);
  }


  void _setChoice(String input) {
    setState(() {
      choice = input;
    });
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

  Widget cashIn() {
    final state = AppState();

    /*if (choice == "") {
      return Text("");
    } else if (input == 0) {
      return Text("");
    } else {*/

    return
      SizedBox(
          height: 50,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                isButtonActive
                    ? () {
                  //setColorBack();
                  setState(() {
                    if (selectedName == choice && checkup != 0) {
                      state.sharedCounter = state.sharedCounter + input * 2; }// Coins Counter erhöhen
                    isButtonActive = false; //Button deaktivieren, damit nur 1 mal Coins eingelöst werden können;
                    currentDiceRoll = 0;
                    StorageHelper.saveCounter();
                  });
                } : null,


                child: const Text('Cash In'),
              ),

            ],
          ));

  }




  void spinWheel() {
    if (isSpinning) return;
    final state = AppState();
    state.sharedCounter = state.sharedCounter - input;
    final index = Fortune.randomInt(0, items.length);
    _setCheckup_1();

    selected.add(index);
    setState(() {
      isSpinning = true;
      selectedName = null;
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        selectedName = items[index];
        isSpinning = false;
        if(selectedName == choice) isButtonActive = true;
      });
    });
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
          SizedBox(width: 20,)
        ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              height: 350,
              width: 400,
              child: FortuneWheel(

                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text(it)),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isSpinning ? null : spinWheel,
            child: Text(isSpinning ? 'Dreht...' : 'Drehen'),//KI
          ),
          SizedBox(height: 20),
          cashIn(),
          //if (selectedName != null)
          //Text(
          //'Gewonnen: $selectedName',
          //style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //),
          chooseColor(),
          inputForm(),
        ],
      ),
    );
  }
}
