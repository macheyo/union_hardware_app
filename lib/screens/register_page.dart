import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:union_hardware_app/widgets/custom_button.dart';
import 'package:union_hardware_app/widgets/custom_input.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {

  bool _registerFormLoading = false;

  String _registeEmail = "";
  String _registerPassword = "";
  FocusNode _passwordFocusNode;

  @override
  void initState(){
    _passwordFocusNode=new FocusNode();
  }
  @override
  void dispose(){
    _passwordFocusNode.dispose();
  }

  Future<void> _alertDialogBuilder(String message) async{
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (context){
      return AlertDialog(
        title: Text("Error"),
        content: Container(
          child: Text(message),
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }
              , child: Text("close"))
        ],
      );
    });
  }

  Future<String> _createAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registeEmail, password: _registerPassword);
      return null;
    }

    catch(e){
      return e.toString();
    }
  }

  void _submitForm() async{
    setState(() {
      _registerFormLoading=true;
    });
    String _createAccountFeedBack = await _createAccount();
    if(_createAccountFeedBack!=null){
      _alertDialogBuilder(_createAccountFeedBack);
      setState(() {
        _registerFormLoading=false;
      });
    }else Navigator.pop(context);
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
                  padding: EdgeInsets.only(
                      top: 24
                  ),
                  child: Text("Create new Account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,),
                ),
                Column(
                  children: [
                    CustomInput(
                      onChanged: (value){
                        _registeEmail=value;
                      },
                      onSubmitted: (value){
                        _passwordFocusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                      hintText:  "Email",
                    ),
                    CustomInput(
                      onChanged: (value){
                        _registerPassword=value;
                      },
                      isPasswordField: true,
                      hintText: "Password",
                      onSubmitted: (value) {
                        _submitForm();
                      },),

                    CustomButton(
                      text: "Create Account",
                      onPressed: (){
                        _submitForm();
                      },
                      isLoading: _registerFormLoading,
                      outlineButton: false,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16
                  ),
                  child: CustomButton(
                    text: "Back to Login",
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    outlineButton: true,
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}

