import 'dart:convert';

import 'package:driver_dai_test/controller/ForgotPasswordController.dart';
import 'package:driver_dai_test/view/verify.dart';
import 'package:driver_dai_test/utils/wrapMe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class password extends StatefulWidget {
  const password({Key? key}) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String phone = '';
    User input = User();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Text("Forgot Password",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
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
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              height: 550,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(30),
              width: 400,
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

              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Forgot Password ?",textAlign: TextAlign.center,style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 35
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image.asset(
                      'images/forgot.png',
                      width: 300,
                      height: 170,
                      fit: BoxFit.fitWidth,

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: Text("    Enter the Phone number \nassociated with your acount",style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(" We will message you a code to reset",style:TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 17,
                      color: Colors.black45
                    ),),
                  ),

                  Center(
                    child: Text("your password.",style:TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 17,
                        color: Colors.black45
                    ),),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Dongle',
                          fontSize: 30
                        ),
                      onChanged: (value){
                        phone = value;
                        input.setPhone(phone);

                      },
                      decoration: InputDecoration(hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          fontFamily: "Dongle" ,
                          fontSize: 25,
                          color: Colors.blue.shade200
                        ),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: (){

                        

                        // ForgotPasswordController send = ForgotPasswordController();
                        // input.setPhone(phone);

                        ForgotPasswordController().sendToken().then((value) {

                          // var valRequired = jsonEncode(value);

                        Map<String, dynamic> data = jsonDecode(value);



                        // Map<String, dynamic> parsedOne = jsonDecode(value);
                        // var data = jsonDecode(value);



                        // input.setPhone(phone);
                        // print(phone);
                        input.setToken(data['passPin']);
                        input.setType(data['type']);



                        Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) => verify() )
                        );

                        });



                      },
                          child: Center(child: Text('SEND')),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          primary: Colors.blueAccent,
                          onPrimary: Colors.white,
                          // elevation: 10,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          textStyle: const TextStyle(
                            fontFamily: 'Dongle',
                            fontSize: 30.0,
                          ),

                        ),),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
