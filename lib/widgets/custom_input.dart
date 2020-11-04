import 'package:flutter/material.dart';
import 'package:union_hardware_app/constants.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function (String)onChanged;
  final Function (String)onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  const CustomInput({Key key, this.hintText, this.onChanged, this.onSubmitted, this.focusNode, this.textInputAction, this.isPasswordField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isPassword=isPasswordField??false;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        obscureText: _isPassword,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText??"Hint ....",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          )
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
