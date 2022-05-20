import 'package:flutter/material.dart';
import 'package:driver_dai_test/view/Driver/driver_home_body.dart';

class DriverHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10,top: 15),
            child: Text("Your Routes",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: Color(0xFFA2D2FF),
        ),
      ),
      body: RouteBody(),
    );
  }
}

