import 'package:flutter/material.dart';
import 'package:online_casino/FirstPage.dart';
import 'package:online_casino/counter.dart';
import 'package:online_casino/input.dart';
import 'coins.dart';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Third Page'),
        actions: <Widget>[
          Coins(),
          SizedBox(width: 20,)
        ],),
      body: Center(
        child:
        Text("data"),

      ),
    );
  }
}