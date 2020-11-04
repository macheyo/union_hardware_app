import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:union_hardware_app/screens/register_page.dart';
import 'package:union_hardware_app/widgets/custom_button.dart';
import 'package:union_hardware_app/widgets/custom_input.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loginFormLoading = false;

  String _loginEmail = "";
  String _loginPassword = "";
  FocusNode _passwordFocusNode;

  Future<void> _alertDialogBuilder(String message) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(message),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("close"))
            ],
          );
        });
  }

  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _loginFormLoading = true;
    });
    String _loginFeedBack = await _loginAccount();
    if (_loginFeedBack != null) {
      _alertDialogBuilder(_loginFeedBack);
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "Welcome User, \n Login to your account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
              ),
            ),
            Column(
              children: [
                CustomInput(
                  onChanged: (value) {
                    _loginEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                  hintText: "Email",
                ),
                CustomInput(
                    onChanged: (value) {
                      _loginPassword = value;
                    },
                    isPasswordField: true,
                    hintText: "Password",
                    onSubmitted: (value) {
                      _submitForm();
                    }),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    _submitForm();
                  },
                  isLoading: _loginFormLoading,
                  outlineButton: false,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomButton(
                text: "Create New Account",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                outlineButton: true,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
