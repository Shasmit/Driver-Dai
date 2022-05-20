import 'package:driver_dai_test/controller/LoginWindowData.dart';
import 'package:flutter/material.dart';
import 'package:driver_dai_test/view/User/details_screen.dart';
import 'package:driver_dai_test/view/User/item_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 10,top: 15),
              child: Text("Available Routes",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            backgroundColor: Color(0xFFA2D2FF),
          ),
        ),
          extendBodyBehindAppBar: false,
        backgroundColor: Color(0xFFFFEDDB),
        extendBody: true,
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //   child: Text(
        //     "All Available Routes",
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline5!
        //         .copyWith(fontWeight: FontWeight.bold),
        //   ),
        // ),
        SizedBox(
          height: 60,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                itemCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  // childAspectRatio: 1,
                ),
                itemBuilder: (context, index) => ItemCard(
                  // route: 1,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          // routes: 1,
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}