
import 'package:flutter/material.dart';
import 'package:online_casino/counter.dart';
import 'dart:math';

import 'package:online_casino/dice.dart';




class IntInputExample extends StatefulWidget {
  const IntInputExample({super.key});

  @override
  State<IntInputExample> createState() =>  _IntInputExampleState();
}

class _IntInputExampleState extends State<IntInputExample> {
  final TextEditingController _controller = TextEditingController();
  int _inputValue = 0;

  void _submit() {

    setState(() {
      _inputValue = int.tryParse(_controller.text) ?? 0;


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter something'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            DiceRoller(inputValue: _inputValue)
          ],
        ),
      ),
    );
  }
}








