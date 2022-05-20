import 'package:driver_dai_test/view/Window.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/simple_prefences.dart';

int? viewed;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SimplePreferences.init();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  viewed = SimplePreferences.getViewed() ?? 1;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Onboarding';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: viewed != 0 ? OnBoardingPage() : DriverDai(),
  );
}
