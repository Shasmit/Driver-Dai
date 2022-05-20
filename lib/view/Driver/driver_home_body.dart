import 'package:driver_dai_test/controller/DriverController.dart';
import 'package:driver_dai_test/utils/wrapMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RouteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User data = User();
    DriverController controller = DriverController();
    return Container(
      color: Color(0xFFFFEDDB),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
          ),
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
              width: 400,
              decoration: BoxDecoration(
                  color: Color(0xFFB1D0E0),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    'images/localbus1.png',
                    width: 300,
                    height: 250,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Machhegaun - Ratnapark",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.start(data.getPhone());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(milliseconds: 2000),
                        content: Text('Updated'),
                        backgroundColor: Color(0xFF1A374D),
                      ));
                    },
                    child: Text(
                      "Start From Machhegaun",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF1A374D)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.stop(data.getPhone());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(milliseconds: 2000),
                        content: Text('Updated'),
                        backgroundColor: Color(0xFF1A374D),
                      ));
                    },
                    child: Text(
                      "Start From Ratnapark",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF1A374D)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 30)),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}