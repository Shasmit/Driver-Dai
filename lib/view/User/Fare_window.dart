import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:driver_dai_test/view/User/Farepage.dart';
import 'package:driver_dai_test/controller/calculateDistance.dart';
import 'package:driver_dai_test/utils/calculateDistanceSyncData.dart';
import 'package:driver_dai_test/utils/lostFoundSyncData.dart';
import 'package:driver_dai_test/view/User/lostandfound.dart';
import 'package:driver_dai_test/view/User/more_menu.dart';
import 'package:driver_dai_test/controller/userLostFound.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(const fare());

class fare extends StatefulWidget {
  const fare({Key? key}) : super(key: key);

  @override
  _fareState createState() => _fareState();
}

class _fareState extends State<fare> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;
  final screens = [
    HomeScreen(),
    const FarePage(),
    const fare1(),
    const drawers(),
    // Container(child:
    // Center(
    //     child: Text("More")),
    // color: Colors.redAccent,),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home_rounded, size: 30),
      const Icon(Icons.money, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.menu, size: 30),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        // backgroundColor: Colors.blueAccent,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.blue.shade100,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            height: 60,
            index: index,
            items: items,
            onTap: (index) {
              if(index == 2) {
                UserLostFound().lostFoundWindow().then((value) {

                  LostFoundSyncData().enterData(value);

                  setState(() => this.index = index);
                });
              }
              else if(index == 1){

                CalculateDistance().loginWindowFare().then((value){

                  CalculateDistanceSyncData().enterData(value);

                  setState(() => this.index = index);

                });
              }
              else{
                setState(() => this.index = index);
              }

            }

          ),
        ),
      ),
    );
  }
}

