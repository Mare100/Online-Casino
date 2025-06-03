import 'dart:math';
import 'counter.dart';
import 'package:flutter/material.dart';
import 'input.dart';
import 'appState.dart';
import 'package:online_casino/FirstPage.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {


  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int currentDiceRoll = 2;
  int choice=0;
  bool isButtonActive = true;
  Color _iconColor = Colors.black;


  final TextEditingController _controller = TextEditingController();
  int input = 0;

  void _submit() {

    setState(() {
      input = int.tryParse(_controller.text) ?? 0;


    });

  }


  Widget check(){
    if(input == 0) {
      return Text("du must Geld setzen");
    }else {
      return Text("du hast $input gesetzt");
    }
  }




  void roleDice() {
    final state = AppState();
    if(input != 0) {
      if(choice != 0) {
        setState(() {
          currentDiceRoll = randomizer.nextInt(6) + 1;
          state.sharedCounter = state.sharedCounter - input;
          isButtonActive = true;
        });
      }
    }
  }




  Widget show(){
    if(currentDiceRoll == 1){
      return SizedBox(height: 200, child: Image.asset('assets/images/dice1.png'));
    }
    if(currentDiceRoll == 2){
      return SizedBox(height: 200, child: Image.asset('assets/images/dice2.png'));
    }
    if(currentDiceRoll == 3){
      return SizedBox(height: 200, child: Image.asset('assets/images/dice3.png'));
    }
    if(currentDiceRoll == 4){
      return SizedBox(height: 200, child: Image.asset('assets/images/dice4.png'));
    }
    if(currentDiceRoll == 5){
      return SizedBox(height: 200, child: Image.asset('assets/images/dice5.png'));
    }else
    {
      return SizedBox(height: 200, child: Image.asset('assets/images/dice6.png'));
    }
  }

  Widget win() {
    final state = AppState();

    if(choice== 0  ){
      return Text("");
    }else
      if(input== 0  ){
        return Text("");
    }else{
      if (currentDiceRoll == choice) {
        return
          SizedBox(
            height: 50,
            child:
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isButtonActive
                  ? () {
                setState(() {
                  state.sharedCounter = state.sharedCounter + input*6; // Coins Counter erhöhen
                  isButtonActive = false; //Button deaktivieren, damit nur 1 mal Coins eingelöst werden können;
                });
              }: null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.lightBlueAccent,
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
              ),
              child: const Text('Cash In'),
            ),

          ],
          ));
      } else {
        return SizedBox(
          height: 50,
          child: Text(""));
      }
    }
  }

  Widget inputForm(){
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
    decoration: InputDecoration(labelText: 'Wie viel setzt du?'),
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: _submit,
    child: Text('Submit'),
    ),
    SizedBox(height: 20),
       ]) )
    ],
    ),
    )
    ]
      );

  }

  void changeColor(){
    setState(() {
      _iconColor = Colors.grey;
    });
  }


  Widget diceButtons(){
    final state = AppState();
    return
      Column(children: [
        Text("Wähle eine Zahl auf die du dein Geld setzt"),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice1.png')),
          onPressed: () {
            _setChoice(1);          },
        ),
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice2.png')),
          onPressed: () {
            _setChoice(2);          },
        ),
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice3.png')),
          onPressed: () {
            _setChoice(3);          },
        ),
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice4.png', color: _iconColor),),
          onPressed: () {
            _setChoice(4);
            changeColor();
          },
        ),
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice5.png')),
          onPressed: () {
            _setChoice(5);

          },
        ),
        IconButton(
          icon: SizedBox(height: 45, child: Image.asset('assets/images/dice6.png')),
          onPressed: () {
            _setChoice(6);
          },
        ),

      ],
    ),

      ],);
  }

  _setChoice(int input){
    final state = AppState();
    setState(() {
      choice = input;
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
    body:
        Column(
        children: [
        SizedBox(height: 60,),
        //check(),
        show(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: roleDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.lightBlueAccent,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Role Dice'),
        ),
        //Text('Current number = $currentDiceRoll!'),
        win(),
          inputForm(),
          //Text("${choice}"),
        ]
        )

    );
  }
}