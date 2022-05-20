import 'package:driver_dai_test/controller/LoginWindowData.dart';
import 'package:driver_dai_test/utils/dataSyncLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  // final Routes route;
  final VoidCallback? press;
  const ItemCard({
    Key? key,
    // required this.route,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginWindowData data = LoginWindowData();
    DataLoginSync data = DataLoginSync();
    print(data.getData());
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFA2D2FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Text("${product.id}"),
                  // tag: "${product.id}",
                  Image.asset("images/localbus1.png"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      // 'hi',
                      '${data.getData()[0]['main_route']}',
                      style: TextStyle(
                        fontFamily: 'Dongle',
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      // 'hello',
                      '${data.getData()[0]['sub_route']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Avenir Next LT Pro Demi',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}