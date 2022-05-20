import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:driver_dai_test/view/Window.dart';
import '../utils/simple_prefences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {

  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      //Creating Pages
      pages: [
        PageViewModel(
          title: 'Choose Your Destination',
          body: "It's pretty simple to choose your destination in our app",
          image: buildImage('images/Destiny.png'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'Be Notified When Bus Leaves',
          body: 'You will get notification whenever the bus leaves from their bus stand',
          image: buildImage('images/noti.png'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'Know Bus Timing',
          body: 'Get to know the timing of the bus',
          // footer: ButtonWidget(
          //   text: 'Proceed',
          //   onClicked: () => goToHome(context),
          // ),
          image: buildImage('images/timee.png'),
          decoration: getPageDecoration(),
        ),
      ],


      // Future _storeOnboardInfo() async {
      //     print("Shared pref called");
      //     int viewed = 0;
      //     await SimplePreferences.init();
      //     await _prefs.setInt('onBoard', viewed);
      //     print(_prefs.getInt('onBoard'));
      //     }

      //Proceed Function
      done: Text('Proceed', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () async {
        await SimplePreferences.storeOnboardInfo();
        goToHome(context);

      },
      //Skip Button
      showSkipButton: true,
      skip: Text('Skip'),
      onSkip: () async {
        await SimplePreferences.storeOnboardInfo();
        goToHome(context);
      },

      next: Icon(Icons.arrow_forward_outlined),
      dotsDecorator: getDotDecoration(),
      skipFlex: 0,
      nextFlex: 0,
    ),
  );

  //Navigating to home page
  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => DriverDai()),
  );

  //Defining buildImage Widget
  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  //Defining getPageDecoration
  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );


  //Defining getDotsDecorator
  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    size: Size(10, 10),
    activeSize: Size(15, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );
}