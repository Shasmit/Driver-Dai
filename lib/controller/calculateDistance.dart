import 'dart:convert';

import 'package:driver_dai_test/controller/UserController.dart';

// import 'package:driver_dai_test/wrapMe.dart';



// import 'UserController.dart';



class CalculateDistance {

  // String check='';



  Future<dynamic> loginWindowFare() {

    UserController value = UserController();



    var data = value.loginCalculateFare().then((value) {

      var valRequired = jsonEncode(value);



      Map<String, dynamic> parsedOne = jsonDecode(value);



      // check = parsedOne['reqInfo'][0]['start_time'];

      return parsedOne['routedistance'];



      // return parse;



      // return this.parse;

    });



    return data;

  }



// Future getInfoAll(int index) {
//
//   return this.loginWindow().then((value) {
//
//     return value[index];
//
//   });
//
// }
//
//
//
// Future getInfoSpecific(int index, String field) {
//
//   // return this.parse[index][field];
//
//
//
//   return this.loginWindow().then((value) {
//
//     return value[index][field];
//
//   });
//
// }

}