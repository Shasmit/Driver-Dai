import 'package:driver_dai_test/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:driver_dai_test/controller/inputDriver.dart';
import 'package:driver_dai_test/model/driverInput.dart';


class DriverSignup extends StatefulWidget {
  const DriverSignup({Key? key}) : super(key: key);

  @override
  _DriverSignupState createState() => _DriverSignupState();
}

class _DriverSignupState extends State<DriverSignup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/window.jpg"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              ListView(
                children: const [SignupDetails()],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    if (value != null && value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value != null && value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }
}

class PhoneNumFieldValidator {
  static String? validate(String? value) {

    if(value == 'Success'){
      return 'Success';
    }
    else if (value != null && value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    else if (value != null && value.length != 10) {
      return 'Phone number must be of 10 digits!';
    }
    else{
      return value;
    }
    return null;
  }
}

class BusNumFieldValidator {
  static String? validate(String? value) {
    if (value != null && value.isEmpty) {
      return 'Bus number can not be empty!';
    }
    return null;
  }
}

class LicenseNumFieldValidator {
  static String? validate(String? value) {
    if (value != null && value.isEmpty) {
      return 'License number cannot be empty';
    } else if (value != null && value.length != 10) {
      return 'License number must be of 10 digits!';
    }
    return null;
  }
}

class SignupDetails extends StatefulWidget {
  const SignupDetails({Key? key}) : super(key: key);

  @override
  State<SignupDetails> createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool isLoading = false;

  DriverInput driver = DriverInput('', '', '', '', '', '');

  final color = const Color(0xFF0A1931);

  InputDecoration textFieldDecoration(
      Icon icon, String hintText, String labelText) {
    return InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
        ),
        prefixIcon: icon,
        hintText: hintText,
        labelText: labelText);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Create a new account',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(25),
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      driver.fullName = value;
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Name can not be empty.';
                      }
                      return null;
                    },
                    decoration: textFieldDecoration(
                        Icon(Icons.account_circle_rounded),
                        'Please type full name',
                        'Full Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        driver.phoneNo = value;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          PhoneNumFieldValidator.validate(value),
                      decoration: textFieldDecoration(Icon(Icons.phone_iphone),
                          'Enter valid phone number', 'Phone Number')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        driver.busNo = value;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          BusNumFieldValidator.validate(value),
                      decoration: textFieldDecoration(
                          Icon(Icons.directions_bus),
                          'Enter valid bus number',
                          'Bus Number')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        driver.liscenseNo = value;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          LicenseNumFieldValidator.validate(value),
                      decoration: textFieldDecoration(
                          Icon(Icons.assignment_ind),
                          'Enter valid license number',
                          'License Number')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      driver.password = value;
                    },
                    obscureText: !_showPassword,
                    controller: _passwordController,
                    validator: (value) =>
                        PasswordFieldValidator.validate(value),
                    decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 0.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => _showPassword = !_showPassword);
                          },
                        ),
                        hintText: 'Minimum 6 characters',
                        labelText: 'Create Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        driver.confirmPassword = value;
                      },
                      controller: _confirmPasswordController,
                      validator: (String? value) {
                        if (value != _confirmPasswordController.value.text) {
                          return 'Password do not match!';
                        }
                        return null;
                      },
                      obscureText: !_showConfirmPassword,
                      decoration: InputDecoration(
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.red, width: 0.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blue, width: 0.0),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showConfirmPassword
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() =>
                              _showConfirmPassword = !_showConfirmPassword);
                            },
                          ),
                          hintText: 'Retype Password',
                          labelText: 'Confirm Password')),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 290,
                  child: TextButton(
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(color),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 20)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 5));

                          setState(() {
                            isLoading = false;
                          });
                        }
                        ;

                        _formKey.currentState?.validate();

                        // Update later
                        InputDriver value = InputDriver(
                            driver.fullName,
                            driver.phoneNo,
                            driver.password,
                            driver.confirmPassword,
                            driver.liscenseNo,
                            driver.busNo);

                        value.signup().then((result) {
                          if (result == 201) {
                            print("Sucess");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()));
                          } else {
                            print(result);
                          }
                        });
                      },
                      child: isLoading
                          ? SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation(Colors.white),
                          ))
                          : const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text('Sign In !')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
