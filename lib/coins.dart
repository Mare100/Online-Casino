
import 'package:flutter/material.dart';
import 'counter.dart';
import 'appState.dart';

class Coins extends StatelessWidget {

  const Coins({super.key});

  @override

  Widget build(BuildContext context) {
    final state = AppState();
    return
    Row(
      children: [
        Icon(
          Icons.currency_bitcoin,
          size: 35,
        ),
        Text('${state.sharedCounter}'),
      ]
    );

  }
}