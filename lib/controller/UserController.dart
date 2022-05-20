import 'dart:convert';
import 'package:driver_dai_test/view/Window.dart';

import 'package:http/http.dart' as http;

class UserController{


  Future loginWindowData() async {
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/getRoutes');

    var response = await http.get(url,
        headers: <String, String>{

          'Content-Type': 'application/json;charSet=UTF-8'
        }

      // body: jsonEncode(<String, String>{
      // 'phone_no': this.phoneNo,
      // 'password': this.password
      //}),
      //   body: <String, String> {
      // 'firstname': this.firstname,
      // 'lastname': this.lastname,
      // 'password': this.password,
      // 'phone_no':this.phoneNo,
      // 'liscense_no':this.liscenseNo,
      // 'bus_no': this.busNo}
    );




    return response.body;



  }


  Future loginCalculateFare() async {
    var url = Uri.parse('http://${ip}:3000/api/v1/route/calculateDistance');

    var response = await http.get(url,
        headers: <String, String>{

          'Content-Type': 'application/json;charSet=UTF-8'
        }

    );




    return response.body;



  }


  Future loginLostFound() async {
    var url = Uri.parse('http://${ip}:3000/api/v1/driver/getLFound');

    var response = await http.get(url,
        headers: <String, String>{

          'Content-Type': 'application/json;charSet=UTF-8'
        }

    );




    return response.body;



  }






}