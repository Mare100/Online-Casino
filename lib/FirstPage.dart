import 'package:flutter/material.dart';
import 'package:online_casino/KenoPage.dart';
import 'package:online_casino/DicePage.dart';
import 'package:online_casino/RockPage.dart';
import 'package:online_casino/RoulettePage.dart';
import 'package:online_casino/coins.dart';
import 'package:online_casino/counter.dart';
import 'roulette.dart';
import 'storageHelper.dart';



enum SampleItem { itemOne, itemTwo, itemThree }

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

      StorageHelper.loadCounter();


    return Scaffold(
      appBar: AppBar(
          //centerTitle: true,
          title: const Text('Online Casino', style: TextStyle(fontSize: 30),),
          toolbarHeight: 100,
          actions: <Widget>[
            Coins(),
            SizedBox(width: 20,)
          ],),
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
                          style: TextStyle(fontSize: 25),),
                      ),
                  ),

            ListTile(
                    title: const Text('LOG IN'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: const Text('Einstellungen'),
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
                ],
              ),
              const SizedBox(
                width: 200.0,
                height: 80.0,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 15),
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
                ],
              )

            ],
          )
      ),
    );
  }
}
