import 'package:flutter/material.dart';
import 'package:online_casino/FirstPage.dart';
import 'package:online_casino/counter.dart';
import 'package:online_casino/input.dart';
import 'package:online_casino/roulette.dart';
import 'coins.dart';
import 'roulette.dart';
import 'Keno.dart';

class RockPage extends StatelessWidget {
  const RockPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child:
        Keno(),

      ),
    );
  }
}