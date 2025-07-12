import 'coins.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'appState.dart';
import 'package:online_casino/FirstPage.dart';
import 'storageHelper.dart';

final randomizer = Random();

class Rock extends StatefulWidget {
  @override
  _RockState createState() => _RockState();
}

class _RockState extends State<Rock> {

  int currentDiceRoll = 0;
  int choice = 0;
  bool isButtonActiveCash = false;
  bool isButtonActiveRole = true;
  int checkup =1;

  Color? _iconColor1 = null;
  Color? _iconColor2 = null;
  Color? _iconColor3 = null;

  final TextEditingController _controller = TextEditingController();
  int input = 0;

  void _submit() { //Verarbeitet die eingaben
    setState(() {
      input = int.tryParse(_controller.text) ?? 0;
      checkInput();
    });
  }

  void checkInput(){ // Checkt ob die Inpit Forms ausgefüllt dsind und gibt dem USer Rückmeldung was fehlt
    setState(() {
      if (choice == 0 && input<= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bitte wählen sie eine Zahl auf die Sie setzen und geben Sie einen gültigen Einsatz an', style: TextStyle(fontFamily: "VarelaRound"),)),
        );
        return;
      }

      if (choice == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bitte wählen sie eine Zahl auf die Sie setzen', style: TextStyle(fontFamily: "VarelaRound"),)),
        );
        return;
      }

      if (input <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bitte geben Sie einen gültigen Einsatz ein.', style: TextStyle(fontFamily: "VarelaRound"),)),
        );
        return;
      }
    });
  }


  /*Widget check() {
    if (input == 0) {
      return Text("du must Geld setzen");
    } else {
      return Text("du hast $input gesetzt");
    }
  }*/


  void roleDice() { // erstellt Zufallszahl 1-6 für den Würfel und zieht einsatz voM Vermögen ab
    final state = AppState();
    checkInput();
    if (input != 0) {
      if (choice != 0) {
        setState(() {
          currentDiceRoll = randomizer.nextInt(3) +1;//erstellt Zufallszahl 1-6 für den Würfel
          state.sharedCounter = state.sharedCounter - input; //zieht einsatz voM Vermögen ab
          StorageHelper.saveCounter(); // persistente Datenspeicherung
          if (currentDiceRoll == choice && checkup != 0) isButtonActiveCash = true; //Aktiviert Cash IN Button
          if (currentDiceRoll == choice && checkup != 0) isButtonActiveRole = false;// Deaktiviert Role Dice Button
        });
        _setCheckup_1();
      }
    }
  }


  Widget show() {


    if (currentDiceRoll == 1) {//Alte Lösung (unschön)
      return SizedBox(
          height: 200, child: Image.asset('assets/images/rock.png'));
    }
    if (currentDiceRoll == 2) {
      return SizedBox(
          height: 200, child: Image.asset('assets/images/paper.png'));
    } else {
      return SizedBox(
          height: 200, child: Image.asset('assets/images/scissors.png'));
    }
  }

  Widget cashIn() {
    final state = AppState();


    return
      SizedBox(
          height: 50,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: isButtonActiveCash
                    ? () {
                  setState(() {
                    StorageHelper.saveCounter();
                    state.sharedCounter = state.sharedCounter +
                        input * 3; // Coins Counter erhöhen
                    isButtonActiveCash = false; //Button deaktivieren, damit nur 1 mal Coins eingelöst werden können;
                    currentDiceRoll = 0;
                    isButtonActiveRole = true;
                  });
                } : null,

                child: const Text('Cash In', style: TextStyle(fontFamily: "VarelaRound"),),
              ),

            ],
          ));

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
                  diceButtons(),
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




  Widget diceButtons() {
    return
      Column(children: [
        Text("Wähle eine Zahl auf die du dein Geld setzt", style: TextStyle(fontFamily: "VarelaRound"),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: SizedBox(height: 45,
                  child: Image.asset(
                      'assets/images/rock.png', color: _iconColor1)),
              onPressed: () {
                _setChoice(1);
                _setCheckup_0();
                setState(() {
                  _iconColor1 = Color(0xFFd0cae4);

                  _iconColor2 = null;
                  _iconColor3 = null;
                });
              },
            ),
            IconButton(
              icon: SizedBox(height: 45,
                  child: Image.asset(
                      'assets/images/paper.png', color: _iconColor2)),
              onPressed: () {
                _setChoice(2);
                _setCheckup_0();
                setState(() {
                  _iconColor2 = Color(0xFFd0cae4);

                  _iconColor1 = null;
                  _iconColor3 = null;
                });
              },
            ),
            IconButton(
              icon: SizedBox(height: 45,
                  child: Image.asset(
                      'assets/images/scissors.png', color: _iconColor3)),
              onPressed: () {
                _setChoice(3);
                _setCheckup_0();
                setState(() {
                  _iconColor3 = Color(0xFFd0cae4);

                  _iconColor1 = null;
                  _iconColor2 = null;

                });
              },
            ),

          ],
        ),

      ],);
  }

  void _setChoice(int input) {
    setState(() {
      choice = input;
    });
  }

  void _setCheckup_0() { //Verhindert dass die gewählte Zahl nach dem Würfeln nochmal gewechselt werden kann
    setState(() {
      checkup = 0;
    });
  }
  void _setCheckup_1() {
    setState(() {
      checkup = 1;
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
          title: const Text('Schere Stein Papier', style: TextStyle(fontSize: 26, fontFamily: "Pacifico"),),
          actions: <Widget>[
            Coins(),
            SizedBox(width: 20,)
          ],),
        body:
        Column(
            children: [
              SizedBox(height: 60,),
//check(),
              show(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isButtonActiveRole
                    ? () {
                  roleDice();
                  //setColorBack();
                  setState(() {
                    StorageHelper.saveCounter();
                  });

                } : null,

                child: const Text('Play    ', style: TextStyle(fontFamily: "VarelaRound"), textAlign: TextAlign.center,),
              ),
//Text('Current number = $currentDiceRoll!'),
              cashIn(),
              inputForm(),
//Text("${choice}"),
            ]
        )

    );
  }
}
