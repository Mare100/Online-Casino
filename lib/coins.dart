//Gebaut von Marc

import 'package:flutter/material.dart';
import 'appState.dart';
import 'storageHelper.dart';

class Coins extends StatelessWidget {

  const Coins({super.key});


  @override

  Widget build(BuildContext context) { // Widget zum Anzeigen des Coins Vermögens
    StorageHelper.loadCounter();

    final state = AppState();
    return
    Row(
      children: [
        Icon(
          Icons.currency_bitcoin,
          size: 35,
        ),
        Text('${state.sharedCounter}' ,style: TextStyle(fontSize: 20,fontFamily: "Pacifico"), ),
      ]
    );

  }
}


