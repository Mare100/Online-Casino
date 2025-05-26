import 'dart:math';
import 'counter.dart';
import 'package:flutter/material.dart';
import 'input.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {

   final int inputValue;

  const DiceRoller({super.key, required this.inputValue});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int currentDiceRoll = 2;



  Widget check(){
    if(widget.inputValue == 0) {
      return Text("du must Geld setzen");
    }else {
      return Text("du hast ${widget.inputValue} gesetzt");
    }
  }



  void rollDice() {
    if(widget.inputValue != 0) {
      setState(() {
        currentDiceRoll = randomizer.nextInt(6) + 1;
      });
    }
  }


  Widget show(){
    if(currentDiceRoll == 1){
      return Image.asset('assets/images/dice1.png');
    }
    if(currentDiceRoll == 2){
      return Image.asset('assets/images/dice2.png');
    }
    if(currentDiceRoll == 3){
      return Image.asset('assets/images/dice3.png');
    }
    if(currentDiceRoll == 4){
      return Image.asset('assets/images/dice4.png');
    }
    if(currentDiceRoll == 5){
      return Image.asset('assets/images/dice5.png');
    }else{
      return Image.asset('assets/images/dice6.png');
    }
  }

   Widget win() {
     if (currentDiceRoll == 1) {
       return Counter(input: widget.inputValue);
     }else{
       return Text("Leider Verloren");
     }
   }





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        check(),
        show(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.lightBlueAccent,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
        Text('Current number = $currentDiceRoll!'),
        win()
      ],
    );
  }
}
