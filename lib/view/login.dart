import 'package:driver_dai_test/view/Driver/Driver_navigation.dart';
import 'package:driver_dai_test/view/User/Fare_window.dart';
import 'package:driver_dai_test/controller/LoginWindowData.dart';
import 'package:driver_dai_test/utils/dataSyncLogin.dart';
import 'package:driver_dai_test/view/forgot_password.dart';
import 'package:driver_dai_test/view/User/user_signup.dart';
import 'package:driver_dai_test/view/Window.dart';
import 'package:flutter/material.dart';
import '../utils/wrapMe.dart';
import 'dart:convert';
import '../controller/loginWrap.dart';
import 'package:flash/flash.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class PhoneNumFieldValidator{
  static String? validate (String? value) {
    if(value=='normal'){
      return 'Success';
    }
    else if(value=='driver'){
      return 'Success';
    }
    else if(value != null && value.isEmpty){
      return 'Phone number cannot be empty!';
    }
    else{
      return 'Yo gotta see the data';
    }
  }
}

class PasswordFieldValidator{
  static String? validate(String? value){
    if(value != null && value.isEmpty){
      return 'Password cannot be empty!';
    }
    return null;
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool isLoading = false;

  User user = User();

  final color = const Color(0xFF0A1931);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async{
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          //backgroundColor: Colors.white,
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/window.jpg"),
                    fit: BoxFit.cover)
            ),
            //child: TextField(decoration: InputDecoration(fillColor: Colors.amber,filled: true),))));
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 0,
                // ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  //alignment: MainAxisAlignment.center,
                  'images/bus_logowhite.png',
                  width: 300,
                  height: 90,
                  fit: BoxFit.fitWidth,

                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  // height:480,
                  width: 400,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  // margin:EdgeInsets.symmetric(vertical: 10.0,horizontal: 45.0),
                  margin: EdgeInsets.all(25),
                  //child: Padding( //not using ListTile widget
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(1),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            fontFamily: 'Slabo',
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Color(0xFF0A1931),
                            letterSpacing: 2.5,
                          ),
                        ),
                        Text(
                          "Sign in to your account",
                          style: TextStyle(
                            fontFamily: 'Slabo',
                            fontSize: 15.0,
                            color: Color(0xFF0A1931),
                            //letterSpacing: 2.5,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                          ),
                          //autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              PhoneNumFieldValidator.validate(value),
                          onChanged: (value){
                            user.setPhone(value);
                          },
                          decoration: InputDecoration(hintText: 'Phone Number',
                            prefixIcon: const Icon(Icons.ad_units_outlined),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro'
                          ),
                          //autovalidateMode: AutovalidateMode.always,
                          validator: (value) =>
                              PasswordFieldValidator.validate(value),
                          onChanged: (value) {
                            user.setPassword(value);
                          },
                          obscureText: !_showPassword,
                          decoration: InputDecoration(hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: "Source Sans Pro" ,
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                            ),
                            // decoration: InputDecoration(hintText: 'Enter Password'),
                          ),
                        ),
                        SizedBox(
                            height:20
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => password() )
                            );
                          },
                          child : Text("Forgot Password?",
                              style: TextStyle(
                                  fontFamily: "Slabo",fontWeight: FontWeight.bold,
                              )),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A1931)),
                          ),
                        ),

                        SizedBox(
                            height:9   //chrome: 25
                        ),

                        TextButton(
                          style: ButtonStyle(
                            padding:
                            MaterialStateProperty.all<EdgeInsets>(const
                            EdgeInsets.symmetric(
                                vertical: 12, horizontal:115
                            )),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(color: Color(0xFF0A1931)))),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A1931)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(Duration(seconds: 5));

                              setState(() {
                                isLoading = false;
                              });
                            }
                            ;



                            _formKey.currentState?.validate();
                            LoginWindowData data = LoginWindowData();
                            User user = User();

                            //TODO: input the values of the text fields as variables in the below class

                            Logged value = new Logged(user.getPhone(), user.getPassword());



                            value.login().then((value) {

                            //var valRequired = jsonEncode(value);
                              //


                            Map<String, dynamic> parsedOne = jsonDecode(value);

                            //String type = parsedOne['type'];

                            if(parsedOne['type'] == 'driver'){

                            user.setName(parsedOne['data']['loginDriver']['fullName']);

                            Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => fare2() )
                            );


                            print('It\'s the driver by the way');


                            }else if(parsedOne['type'] == 'normal'){



                              user.setName(parsedOne['data']['loginUser']['firstname']);
                              LoginWindowData().loginWindow().then((value) {

                                DataLoginSync().enterData(value);
                                // DataLoginSync da = DataLoginSync();
                                // da.enterData(value);
                                // print(da.data);
                                // print(value);


                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => fare() )
                                );


                                print('Who me, I am the normii');





                              });



                            }else if(parsedOne['type']=='super'){

                            //TODO: pass the user to the super-user window

                            print('I am the greatest, the super-man');

                            }
                            else{

                            //TODO: Show an error message as anything like no account, wrong combination
                            //something like that

                            print('Seems like we\'ve got an error!');

                            }

                            });
                          },
                          child: isLoading
                              ? SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ))
                         : const Text('Log In', style: TextStyle(fontSize: 18,
                              fontFamily: "Slabo")
                            ,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness:1,
                        ),
                        Text("Don't have an account?",
                          style: TextStyle(
                              fontFamily: "Slabo"
                          ),),
                        TextButton(
                          onPressed: (){
                            isUser
                                ? Navigator.pushNamed(context, '/user_signup')
                                : Navigator.pushNamed(context, '/driver_signup');
                          },
                          child : Text("Register",
                            style: TextStyle(
                                fontFamily: "Slabo",
                              fontWeight: FontWeight.bold,
                            ),),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A1931)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
