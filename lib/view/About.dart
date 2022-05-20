import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Text("About This App",style: TextStyle(fontFamily: "Dongle",fontSize: 40, color: Colors.black)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: Color.fromARGB(500,254, 219, 208),
          foregroundColor: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xFFFFEDDB),
      extendBody: true,

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                'images/bus_logo.png',
                width: 350,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(30),
              width:500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text("Driver Dai is an android application which will help the users to see the public vehicle’s schedules of different routes. This will give users a rough idea of the time at which they should reach the bus stop to prevent missing the bus But there are many factors which affects the schedule and that is why drivers will be able to notify users few minutes (normally about 5 minutes) before the vehicle starts through this application."
                      ,textAlign: TextAlign.center,style: TextStyle(
                    fontFamily: 'Avenir Next LT Pro Demi',
                    fontSize: 20.0,
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Driver Dai',textAlign: TextAlign.center,style: TextStyle(
                    fontFamily: 'Avenir Next LT Pro Demi',
                    fontSize: 20.0,
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Version : 1.0.0',textAlign: TextAlign.center,style: TextStyle(
                    fontFamily: 'Avenir Next LT Pro Demi',
                    fontSize: 20.0,
                  ),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
