import 'package:driver_dai_test/view/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:driver_dai_test/view/Driver/driver_signup.dart';
import 'package:driver_dai_test/view/User/user_signup.dart';

void main() => runApp(DriverDai());

class DriverDai extends StatefulWidget {
  const DriverDai({Key? key}) : super(key: key);

  @override
  State<DriverDai> createState() => _DriverDaiState();
}

class _DriverDaiState extends State<DriverDai> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => Login(),
        '/user_signup': (context) => UserSignup(),
        '/driver_signup': (context) => DriverSignup(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0xFFDCDCD5),
        body: SafeArea(
          child: DriverUser(),
        ),
      ),
    );
  }
}

bool isUser = false;
String ip = '192.168.1.71';


class DriverUser extends StatefulWidget {
  const DriverUser({Key? key}) : super(key: key);

  @override
  _DriverUserState createState() => _DriverUserState();
}

class _DriverUserState extends State<DriverUser> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final img = 'images/window.jpg';
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('images/user.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Login As',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.black,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
              decorationColor: Colors.black38,
            ),
          ),
          const SizedBox(
            height: 30.0,
            width: 200.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 45,
            width: 250,
            child: ElevatedButton(
              child: Text('USER'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 10,
                padding: EdgeInsets.all(10),
                textStyle: const TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                isUser = true;
                Navigator.pushNamed(context, '/login');
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            width: 250,
            child: ElevatedButton(
              child: Text('DRIVER'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 10,
                padding: EdgeInsets.all(10),
                textStyle: const TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                isUser = false;
                Navigator.pushNamed(context, '/login');
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ),
        ],
      ),
    );
  }
}


