import 'dart:convert';
import 'package:driver_dai_test/controller/loginWrap.dart';
import 'package:driver_dai_test/view/login.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  test('correct phone number and password returns error string',()async{
    await Logged('9849519668', 'driverdai68').login().then((value) {
      Map<String, dynamic> parsedOne = jsonDecode(value);
      var val;

      if (parsedOne['type'] == 'normal'){
        //return '9849519667';
        val = 'normal';
      }
      var result = PhoneNumFieldValidator.validate(val);
      expect(result, 'Success');
    }
    );
  });
  test('correct phone number and password returns error string',()async{
    await Logged('9824568100', 'carbonnanotubes').login().then((value) {
      Map<String, dynamic> parsedOne = jsonDecode(value);
      var val;

      if(parsedOne['type'] == 'driver'){
        val = 'driver';
      }
      var result = PhoneNumFieldValidator.validate(val);
      expect(result, 'Success');
    }
    );
  });

  test('empty phone number returns error string', () {
    var result = PhoneNumFieldValidator.validate('');
    expect(result, 'Phone number cannot be empty!');
  });

  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty!');
  });
}
