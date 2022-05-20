import 'package:driver_dai_test/controller/ForgotPasswordController.dart';
import 'package:driver_dai_test/view/login.dart';
import 'package:driver_dai_test/utils/wrapMe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  bool _showPassword = false;
  bool _conPassword = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int tokenField = 0;
    String password = '';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Text("Verification",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 600,
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
                    Text("Verify Code",textAlign: TextAlign.center,style: TextStyle(
                        fontFamily: 'Dongle',
                        fontSize: 35
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Image.asset(
                        'images/verify.png',
                        width: 200,
                        height: 160,
                        fit: BoxFit.fitWidth,

                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Center(
                        child: Text("Enter the Verification code",style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Text(" we just messaged you",style:TextStyle(
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
                            tokenField = int.parse(value);
                            User().settokenField(tokenField);
                          },

                          decoration: InputDecoration(hintText: 'Enter the confirmation code',
                            hintStyle: TextStyle(
                                fontFamily: "Dongle" ,
                                fontSize: 25,
                                color: Colors.blue.shade200
                            ),

                          )
                      ),
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
                            password = value;
                            User().setPassword(password);


                          },
                          controller: _passwordController,
                          validator: (value) =>
                              PasswordFieldValidator.validate(value),
                          obscureText: !_showPassword,
                          decoration: InputDecoration(hintText: 'Enter new password',
                            hintStyle: TextStyle(
                                fontFamily: "Dongle" ,
                                fontSize: 25,
                                color: Colors.blue.shade200
                            ),
                            // prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Dongle',
                              fontSize: 30
                          ),
                          controller: _confirmPasswordController,
                          validator: (String? value) {
                            if (value != _passwordController.value.text) {
                              return 'Password do not match!';
                            }
                            return null;
                          },
                          obscureText: !_conPassword,
                          decoration: InputDecoration(hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                                fontFamily: "Dongle" ,
                                fontSize: 25,
                                color: Colors.blue.shade200
                            ),
                            // prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _conPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => _conPassword = !_conPassword);
                              },
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
                        child: ElevatedButton(onPressed: (){
                          _formKey.currentState?.validate();
                          User data = User();
                          // print('token:::::${tokenField}');
                          if(data.gettokenField() == data.getToken()){

                            ForgotPasswordController().updatePassword().then((value) {


                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Login())
                              );


                            });



                          }

                        },
                          child: Center(child: Text('Proceed')),
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
      ),
    );
  }
}
