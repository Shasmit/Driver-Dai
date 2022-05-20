import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:driver_dai_test/view/Window.dart';

class Logged{
  String phoneNo;
  String password;


  Logged(
      this.phoneNo,
      this.password){}

  //     String bus_no){
  //
  //   this.firstname = firstname;
  //   this.lastname = lastname;
  //   this.busNo = bus_no;
  //   this.liscenseNo = liscense_no;
  //   this.password = password;
  //   this.phoneNo = phone_no;
  //
  // }
  Future login() async {
    var url1 = Uri.parse('http://${ip}:3000/api/v1/driver/login');

    var response1 = await http.post(url1,
      headers: <String, String>{

        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'phone_no': this.phoneNo,
        'password': this.password
      }),
      //   body: <String, String> {
      // 'firstname': this.firstname,
      // 'lastname': this.lastname,
      // 'password': this.password,
      // 'phone_no':this.phoneNo,
      // 'liscense_no':this.liscenseNo,
      // 'bus_no': this.busNo}
    );

    var url2 = Uri.parse('http://${ip}:3000/api/v1/users/login');

    var response2 = await http.post(url2,
      headers: <String, String>{

        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'phone_no': this.phoneNo,
        'password': this.password
      }),

    );


    // print(this.firstname);
    // print(this.lastname);

    //print(response.body);
    //return response1.statusCode;

    if (response1.statusCode == 200) {
      //print(response1.body);
      return response1.body;
    } else if (response2.statusCode == 200) {
      return response2.body;
    } else {
      return response1.body;
    }
  }

}

