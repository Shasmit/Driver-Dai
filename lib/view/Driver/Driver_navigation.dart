import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:driver_dai_test/view/Driver/driver_home_screen.dart';
import 'package:driver_dai_test/view/Driver/lostandfoundDriver.dart';
import 'package:flutter/material.dart';
import 'package:driver_dai_test/view/Driver/more_menu_driver.dart';
import 'package:google_fonts/google_fonts.dart';


void main() => runApp(fare2());

class fare2 extends StatefulWidget {
  const fare2({Key? key}) : super(key: key);

  @override
  _fareState createState() => _fareState();
}

class _fareState extends State<fare2> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;
  final screens = [
    DriverHomeScreen(),
    lost1(),
    drivers(),
  ];
  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.home_rounded,size: 30),
      Icon(Icons.search,size: 30),
      Icon(Icons.menu,size: 30),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        // backgroundColor: Colors.blueAccent,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.black),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.blue.shade100,
            buttonBackgroundColor: Colors.red.shade50,
            backgroundColor: Colors.transparent,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   textTheme: TextTheme(
      //     subtitle1: GoogleFonts.slabo13px(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w600,
      //       fontSize: 18,
      //     ),
      //     headline6: GoogleFonts.slabo13px(
      //       color : Colors.black,
      //       fontSize: 18,
      //     ),
      //     bodyText2: GoogleFonts.slabo13px(
      //       fontSize: 14,
      //       color: Colors.black,
      //     ),
      //   ),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
    );
  }
}

