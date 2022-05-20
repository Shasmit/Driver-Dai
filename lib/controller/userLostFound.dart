import 'dart:convert';

import 'package:driver_dai_test/controller/UserController.dart';

// import 'package:driver_dai_test/wrapMe.dart';



// import 'UserController.dart';



class UserLostFound {

  // String check='';



  Future<dynamic> lostFoundWindow() {

    UserController value = UserController();



    var data = value.loginLostFound().then((value) {

      var valRequired = jsonEncode(value);



      Map<String, dynamic> parsedOne = jsonDecode(value);



      // check = parsedOne['reqInfo'][0]['start_time'];

      return parsedOne['LFoundInfo'];



      // return parse;



      // return this.parse;

    });



    return data;

  }




}