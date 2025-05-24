import 'package:flutter/material.dart';
import 'appState.dart';


class Counter extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".


  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  void _refresh() {
    final state = AppState();
    setState(() {
      state.sharedCounter++;
      state.sharedCounter--;
    });
  }


  void _increment() {
    final state = AppState();
    setState(() {
      state.sharedCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = AppState();

    return Row(
      children: [
        IconButton(
          iconSize: 35,
          icon:  Icon(Icons.currency_bitcoin),
          onPressed: () {
            _increment();
            _refresh();
          },
        ),
        Text('${state.sharedCounter}'),
      ],
    );
  }
}