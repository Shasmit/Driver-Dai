import 'package:driver_dai_test/view/About.dart';
import 'package:driver_dai_test/view/Window.dart';
import 'package:driver_dai_test/utils/dataSyncLogin.dart';
import 'package:driver_dai_test/view/login.dart';
import 'package:driver_dai_test/utils/wrapMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class drivers extends StatefulWidget {
  const drivers({Key? key}) : super(key: key);

  @override
  _driversState createState() => _driversState();
}

class _driversState extends State<drivers> {
  DataLoginSync data = DataLoginSync();
  User user = User();
  final padding = EdgeInsets.symmetric(horizontal: 15);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    final name = '${user.getName()}'.toUpperCase();
    final phone = 'Phone no : ${user.getPhone()}';
    return Scaffold(
      backgroundColor: Color(0xFFFFEDDB),
      body: Container(
        // color: Colors.white30,
        child: ListView(
          children:  <Widget>[
            Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: Color(0xFFA2D2FF),
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: buildHeader(name: name, phone: phone)),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  // Divider(color: Colors.white),
                  const SizedBox(height: 10),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFA2D2FF),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: buildMenuItem(
                        text: 'Profile',
                        icon: Icons.assignment_ind_rounded,
                        onClicked: () => selectedItem(context, 0),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white60,
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFA2D2FF),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: buildMenuItem(
                        text: 'About App',
                        icon: Icons.info,
                        onClicked: () => selectedItem(context, 1),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white60,
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFA2D2FF),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: buildMenuItem(
                        text: 'Help',
                        icon: Icons.help,
                        onClicked: () => selectedItem(context, 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.black,thickness: 2,),
                  const SizedBox(height: 20),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFA2D2FF),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: buildMenuItem(
                        text: 'Log-Out',
                        icon: Icons.logout,
                        onClicked: () => selectedItem(context, 3),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('images/Driver Dai-logos_black.png'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
  Widget buildHeader({
    required String name,
    required String phone,

  }) =>
      Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade400,
              child: Icon(Icons.people,size: 35,color: Colors.white),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontFamily: 'Avenir Next LT Pro Demi',fontSize: 22, color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  phone,
                  style: TextStyle(fontFamily: 'Avenir Next LT Pro Demi',fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hover = Colors.white60;

    return ListTile(
      leading: Icon(icon,color: color),
      title: Text(text,style: TextStyle(fontFamily: 'Dongle',color: color,
      fontSize: 35)),
      hoverColor: hover,
      onTap: onClicked,
    );

  }

  void selectedItem(BuildContext context, int index){
    // Navigator.of(context).pop();
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) =>  AlertDialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
            ),
            backgroundColor: Colors.blue[100],
            title: const Text('Logout!!!',textAlign: TextAlign.center),titleTextStyle: const TextStyle(
              fontFamily: 'Dongle',
              color: Colors.black,
              fontSize: 35.0),
            content: const Text('You sure you want to \n Log-out?',textAlign: TextAlign.center),contentTextStyle: const TextStyle(
              fontFamily: 'Source Sans Pro',
              fontStyle: FontStyle.italic,
              color: Colors.black,
              fontSize: 20.0),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel',style: TextStyle(
                  fontFamily: 'Dongle',
                  fontSize: 27,
                  color: Colors.black,
                ),),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => DriverDai() )
                  );
                },
                child: const Text('OK',style: TextStyle(
                  fontFamily: 'Dongle',
                  fontSize: 27,
                  color: Colors.black,
                ),),
              ),
            ],
          ),
        ));
        break;
    }

  }

}



// const SizedBox(height: 25),
// Divider(color: Colors.black),
// Container(
//   color: Colors.white30,
//   child: SizedBox(
//     height: 25,
//   ),
// ),
// SizedBox(
//   height: 10,
// ),
// Container(
//   height: 60,
//   padding: padding,
//   decoration: BoxDecoration(
//     color: Colors.lightBlue,
//     borderRadius: const BorderRadius.all(Radius.circular(5)),
//   ),
//   child: Center(
//     child: buildMenuItem(
//       text: 'About App',
//       icon: Icons.info,
//       onClicked: () => selectedItem(context, 0),
//     ),
//   ),
// ),
// Container(
//   color: Colors.white60,
//   child: SizedBox(
//     height: 20,
//   ),
// ),
// Container(
//   padding: padding,
//   height: 60,
//   decoration: BoxDecoration(
//     color: Colors.lightBlue,
//     borderRadius: const BorderRadius.all(Radius.circular(5)),
//   ),
//   child: Center(
//     child: buildMenuItem(
//       text: 'Help',
//       icon: Icons.help,
//       onClicked: () => selectedItem(context, 1),
//     ),
//   ),
// ),
// Container(
//   color: Colors.white60,
//   child: SizedBox(
//     height: 20,
//   ),
// ),
// Container(
//   padding: padding,
//   height: 60,
//   decoration: BoxDecoration(
//     color: Colors.lightBlue,
//     borderRadius: const BorderRadius.all(Radius.circular(5)),
//   ),
//   child: Center(
//     child: buildMenuItem(
//       text: 'Log-Out',
//       icon: Icons.logout,
//       onClicked: () => selectedItem(context, 2),
//     ),
//   ),
//
// ),







