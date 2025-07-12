import 'package:flutter/material.dart';
import 'package:online_casino/FirstPage.dart';
import 'package:online_casino/counter.dart';
import 'package:online_casino/input.dart';
import 'dice.dart';
import 'coins.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

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