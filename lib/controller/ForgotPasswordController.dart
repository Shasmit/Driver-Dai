import 'dart:convert';

import 'package:driver_dai_test/utils/wrapMe.dart';
import 'package:http/http.dart' as http;
import 'package:driver_dai_test/view/Window.dart';

class ForgotPasswordController {

  // }
  Future<dynamic> sendToken() async {
    var url = Uri.parse('http://${ip}:3000/api/v1/users/forgotPasswordToken');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "phone_num": '${User().getPhone()}'
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
    return response.body;
  }

  Future<dynamic> updatePassword() async {
    var url = Uri.parse('http://${ip}:3000/api/v1/users/passwordUpdate');

    User user = User();

    print('${user.getPhone()} , ${user.getType()} ,${user.getPassword()}');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "type":'${user.getType()}',
        "phone_num":'${user.getPhone()}',
        "newPass": '${user.getPassword()}'
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