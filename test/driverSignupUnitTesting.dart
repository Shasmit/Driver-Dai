import 'package:driver_dai_test/controller/inputDriver.dart';
import 'package:driver_dai_test/view/Driver/driver_signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // Password TextFormField Testing
  test('correct fullName, phone number, password, liscenceNo and busNo returns Success string', ()async {
    //var lo = new InputDriver(fullName, phoneNo, password, confirmPassword, liscenseNo, busNo)
    await InputDriver('miyagi Dogo','9824568169','carbonnanotubes','carbonnanotubes','1234587899','567488').signup().then((value) {
      var val;

      if (value == 201) {
        //print("Sucess");

        val = 'Success';
      }
      var result = PhoneNumFieldValidator.validate(val);
      expect(result, 'Success');
    });
  });

  // Phone Number TextFormField Testing
  test('empty phone number must return error string', () {
    var result = PhoneNumFieldValidator.validate('');
    expect(result, 'Phone number cannot be empty');
  });

  test('phone number having more or less than 10 digits must return error string',(){
    var result = PhoneNumFieldValidator.validate('12345');
    expect(result, 'Phone number must be of 10 digits!');
  });

  test('phone number having exactly 10 digits must return null', () {
    var result = PhoneNumFieldValidator.validate('1234567890');
    expect(result, null);
  });

  test('empty password must return error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty');
  });

  test('password having less than 8 characters must return error string', () {
    var result = PasswordFieldValidator.validate('134509876');
    expect(result, 'Password must be at least 8 characters long.');
  });

  test('password having 8 or more characters must return null', () {
    var result = PasswordFieldValidator.validate('134567890');
    expect(result, null);
  });

  //Bus Number TextFormField Testing
  test('empty bus number must return error string', () {
    var result = BusNumFieldValidator.validate('');
    expect(result, 'Bus number can not be empty!');
  });

  test('non empty bus number must return null', () {
    var result = BusNumFieldValidator.validate('');
    expect(result, null);
  });

  //License Number TextFormField Testing
  test('empty license number must return error string', () {
    var result = LicenseNumFieldValidator.validate('');
    expect(result, 'License number cannot be empty');
  });

  test('license number having more or less than 10 digits must return error string', () {
    var result = LicenseNumFieldValidator.validate('78965');
    expect(result, 'License number must be of 10 digits!');
  });

  test('license number having exactly 10 digits must return null', () {
    var result = LicenseNumFieldValidator.validate('1234056789');
    expect(result, null);
  });

}
