import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:driver_dai_test/view/Window.dart';

class InputDriver{
  String fullName;
  String phoneNo;
  String password;
  String confirmPassword;
  String liscenseNo;
  String busNo;


  InputDriver(this.fullName,
       this.phoneNo,
      this.password,
      this.confirmPassword,
      this.liscenseNo,
      this.busNo){}

  Future signup() async{
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/signup');
    
    var response = await http.post(url,
        headers:<String, String>{

          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'fullName': this.fullName,
          'password': this.password,
          'confirm_password':this.confirmPassword,
          'phone_no':this.phoneNo,
          'liscense_no':this.liscenseNo,
          'bus_no': this.busNo
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

    print(response.body);
    return response.statusCode;



  }
}