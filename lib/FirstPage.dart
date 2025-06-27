import 'package:flutter/material.dart';
import 'package:online_casino/SecondPage.dart';
import 'package:online_casino/ThirdPage.dart';
import 'package:online_casino/coins.dart';
import 'package:online_casino/counter.dart';
import 'roulette.dart';



enum SampleItem { itemOne, itemTwo, itemThree }

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {


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
                        color: Colors.blue,
                       ),
                        child: Text('Einstellungen',
                          style: TextStyle(fontSize: 25),),
                      ),
                  ),

            ListTile(
                    title: const Text('Item 1'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
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
                  IconButton(
                    iconSize: 175,
                    icon:  Icon(Icons.casino),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondPage()),
                      );
                    },
                  ),
                  IconButton(
                    iconSize: 175,
                    icon:  Icon(Icons.casino),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const ThirdPage()),
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
                  IconButton(
                    iconSize: 175,
                    icon:  Icon(Icons.casino),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    iconSize: 175,
                    icon:  Icon(Icons.casino),
                    onPressed: () {

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
