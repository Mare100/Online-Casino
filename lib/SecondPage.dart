import 'package:flutter/material.dart';
import 'package:online_casino/FirstPage.dart';
import 'package:online_casino/counter.dart';
import 'package:online_casino/input.dart';
import 'dice.dart';
import 'coins.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child:
        DiceRoller(),

      ),
    );
  }
}