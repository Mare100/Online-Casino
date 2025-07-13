import 'package:flutter/material.dart';
import 'package:online_casino/KenoPage.dart';
import 'package:online_casino/DicePage.dart';
import 'package:online_casino/RockPage.dart';
import 'package:online_casino/RoulettePage.dart';
import 'package:online_casino/coins.dart';
import 'storageHelper.dart';



enum SampleItem { itemOne, itemTwo, itemThree }

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {

  void initState() {
    super.initState();
    _loadCoinsOnStartup();
  }

  Future<void> _loadCoinsOnStartup() async {
    await StorageHelper.loadCounter(); // Coins aus SharedPreferences oder Datei laden
    setState(() {}); // UI neu bauen, damit Coins korrekt angezeigt werden
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Casino',
            style: TextStyle(fontSize: 30, fontFamily: "Pacifico")),
        toolbarHeight: 100,
        actions: <Widget>[
          Coins(), // Coins-Widget zeigt aktuellen Stand
          const SizedBox(width: 20),
        ],
      ),
          drawer:
            SizedBox(width: 205,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                   height: 120, // Set your desired height here
                      child: DrawerHeader(
                       decoration: BoxDecoration(
                        color: Color(0xFFaf7ac5),
                       ),
                        child: Text('Einstellungen',
                          style: TextStyle(fontSize: 25, fontFamily: "VarelaRound"),),
                      ),
                  ),

            ListTile(
                    title: const Text('LOG IN', style: TextStyle(fontFamily: "VarelaRound"),),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: const Text('Coins', style: TextStyle(fontFamily: "VarelaRound"),),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
          ),),


      body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 15),
                  Column(children: [
                  IconButton(
                    icon: SizedBox(height: 160,
                        child: Image.asset(
                            'assets/images/dice0.jpg')),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DicePage()),
                      );
                    },
                  ),
                    const Text('Würfeln\n   ', style: TextStyle(fontSize: 30, fontFamily: "Pacifico" ), textAlign: TextAlign.center,),],),
                  Column(children: [
                  IconButton(

                    icon: SizedBox(height: 175,
                        child: Image.asset(
                            'assets/images/rad.png')),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const RoulettePage()),
                      );
                    },
                  ),
                    const Text('Roulette\n   ', style: TextStyle(fontSize: 30, fontFamily: "Pacifico" ), textAlign: TextAlign.center,),
                  ],)
                ],
              ),
              const SizedBox(
                width: 200.0,
                height: 40.0,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 15),
                  Column(children: [
                  IconButton(
                    icon: SizedBox(height: 160,
                        child: Image.asset(
                            'assets/images/Keno.png')),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const KenoPage()),
                      );
                    },
                  ),
                    const Text('Keno Lotto\n   ', style: TextStyle(fontSize: 30, fontFamily: "Pacifico" ), textAlign: TextAlign.center,),
                  ],),
                  Column( children: [
                    IconButton(
                      icon: SizedBox(height: 160,
                          child:
                           Image.asset('assets/images/RockLogo.png')
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const RockPage()),
                        );
                      },
                    ),
                    const Text('Schere Stein \n Papier', style: TextStyle(fontSize: 30, fontFamily: "Pacifico" ), textAlign: TextAlign.center,),
                  ]
                  )
                ],
              )

            ],
          )
      ),
    );
  }
}
