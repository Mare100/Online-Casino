
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:online_casino/storageHelper.dart';
import 'appState.dart';
import 'FirstPage.dart';

class Rock extends StatefulWidget {
  @override
  _RockState createState() => _RockState();
}

class _RockState extends State<Rock> {

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
