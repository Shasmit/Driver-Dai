import 'package:driver_dai_test/controller/LoginWindowData.dart';
import 'package:driver_dai_test/view/User/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/dataSyncLogin.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // final Routes routes;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        // each product have a color
        backgroundColor: Color(0xFFA2D2FF),
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFA2D2FF),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'images/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      // SizedBox(width: kDefaultPaddin / 2)
    );
  }
}

DataLoginSync data = DataLoginSync();

class Body extends StatelessWidget {
  // final Routes routes;

  // Body({Key? key, required this.routes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: ListView(
              children: getAllNotifications(),
            )),
        RouteTitleWithImage(),
      ],
    );
  }
}

class RouteTitleWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${data.getData()[0]['main_route']}',
            style: TextStyle(
                fontFamily: 'Avenir Next LT Pro Demi',
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              Expanded(
                child: Image.asset(
                  "images/localbus1.png",
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}