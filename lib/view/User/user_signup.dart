import 'package:driver_dai_test/view/login.dart';
import 'package:flutter/material.dart';
import '../../controller/inputUser.dart';
import '../../model/userInput.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({Key? key}) : super(key: key);

  @override
  _UserSignupState createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
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

class SignupDetails extends StatefulWidget {
  const SignupDetails({Key? key}) : super(key: key);

  @override
  State<SignupDetails> createState() => _SignupDetailsState();
}

class EmailFieldValidator {
  static String? validate(String? value) {
    String pattern =
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email address can not be empty!';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address!';
    } else {
      return null;
    }
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

class _SignupDetailsState extends State<SignupDetails> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool isLoading = false;

  UserInput user = UserInput('', '', '', '', '');

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
          padding: const EdgeInsets.only(top: 20),
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
          margin: const EdgeInsets.all(30),
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
                          user.fullName = value;
                        },
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Name cannot be empty.';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(
                            Icon(Icons.account_circle_rounded),
                            'Please type full name',
                            'Full Name'))),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        user.phoneNo = value;
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
                        user.email = value;
                      },
                      validator: (value) => EmailFieldValidator.validate(value),
                      decoration: textFieldDecoration(
                          Icon(Icons.email), 'Enter valid email', 'Email')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      user.password = value;
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
                        // labelText: 'Email',
                        hintText: 'Minimum 6 characters',
                        labelText: 'Create Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      onChanged: (value) {
                        user.confirmPassword = value;
                      },
                      controller: _confirmPasswordController,
                      validator: (String? value) {
                        if (value != _passwordController.value.text) {
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
                  width: 285,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(color),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 20)),
                    ),
                    child: isLoading
                        ? SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ))
                        : const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
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
                      InputUser value = InputUser(user.fullName, user.phoneNo,
                          user.password, user.confirmPassword, user.email);

                      value.signup().then((result) {
                        if (result == 201) {
                          print("sucess");
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        } else {
                          print(result);
                        }
                      });
                    },
                  ),
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
