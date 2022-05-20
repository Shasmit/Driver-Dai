import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:driver_dai_test/view/Window.dart';

class DriverController {

  // }
  Future start(String phoneNo) async {
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/start');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{"phone_num": phoneNo}),
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

  Future stop(String phoneNo) async {
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/stop');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{"phone_num": phoneNo}),
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

  Future sendLostFound(
      String phoneNo,
      String lFound_Item,
      String lFound_Details
      ) async {
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/lostAndFound');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "phone_num": phoneNo,
        "lFoundItem": lFound_Item,
        "lFoundDetail": lFound_Details
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
