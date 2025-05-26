import 'package:flutter/material.dart';
import 'package:online_casino/input.dart';
import 'appState.dart';


class Counter extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  final int input;

  const Counter({super.key,required this.input});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {



  void _increment() {
    //final marc = Input();
    final state = AppState();
    setState(() {
      state.sharedCounter = state.sharedCounter +1;
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = AppState();


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      TextButton(
      onPressed: _increment,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightBlueAccent,
        textStyle: const TextStyle(
          fontSize: 28,
        ),
      ),
      child: const Text('Cash In'),

        ),
        Text('${state.sharedCounter}'),

      ],
    );
  }
}