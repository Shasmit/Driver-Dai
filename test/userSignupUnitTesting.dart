import 'package:driver_dai_test/controller/inputUser.dart';
import 'package:driver_dai_test/view/User/user_signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'correct fullName, phone number, password, liscenceNo and busNo returns Success string',
      () async {
    //var lo = new InputUser(fullName, phoneNo, password, confirmPassword, email);
    await InputUser('Elon Dai', '9438920099', 'spacex69', 'spacex69',
            'muskyelon69@gmail.com')
        .signup()
        .then((value) {
      var val;

      if (value == 201) {
        //print("Sucess");

        val = 'Success';
      }
      var result = PhoneNumFieldValidator.validate(val);
      expect(result, 'Success');
    });
  });

  //Email testing
  test('empty email returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email address can not be empty!');
  });

  test('email with invalid format returns error string', () {
    var result = EmailFieldValidator.validate('bista@gmail');
    expect(result, 'Enter a valid email address!');
  });

  test('email with valid format returns null', () {
    var result = EmailFieldValidator.validate('bista@gmail.com');
    expect(result, null);
  });

  //Password Testing
  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty');
  });

  test('password having less than 8 characters returns error string', () {
    var result = PasswordFieldValidator.validate('123456');
    expect(result, 'sddik.');
  });

  test('password having 8 or more characters returns null', () {
    var result = PasswordFieldValidator.validate('123456789');
    expect(result, null);
  });

  //phone number testing
  test('empty phone number returns error string', () {
    var result = PhoneNumFieldValidator.validate('');
    expect(result, 'Phone number cannot be empty');
  });

  test('phone number not equal to 10 digits returns error string', () {
    var result = PhoneNumFieldValidator.validate('123456');
    expect(result, 'Phone number must be of 10 digits!');
  });

  test('phone number having exactly 10 digits returns null', () {
    var result = PhoneNumFieldValidator.validate('9863215589');
    expect(result, null);
  });
}
