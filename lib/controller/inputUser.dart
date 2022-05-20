import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:driver_dai_test/view/Window.dart';

class InputUser{
  String fullName;
  String phoneNo;
  String password;
  String confirmPassword;
  String email;


  InputUser(this.fullName,
      this.phoneNo,
      this.password,
      this.confirmPassword,
      this.email){}


  Future signup() async{
    var url = Uri.parse('http://${ip}:3000/api/v1/users/signup');

    var response = await http.post(url,
      headers:<String, String>{

        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'fullName': this.fullName,
        'password': this.password,
        'phone_no':this.phoneNo,
        'confirm_password':this.confirmPassword,
        'email': this.email
      }),
      //   body: <String, String> {
      // 'firstname': this.firstname,
      // 'lastname': this.lastname,
      // 'password': this.password,
      // 'phone_no':this.phoneNo,
      // 'liscense_no':this.liscenseNo,
      // 'bus_no': this.busNo}
    );


    // print(this.firstname);
    // print(this.lastname);

    //print(response.body);
    return response.statusCode;



  }
}