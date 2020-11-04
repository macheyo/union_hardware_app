import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineButton;
  final bool isLoading;
  CustomButton({this.text, this.onPressed, this.outlineButton, this.isLoading, });

  @override
  Widget build(BuildContext context) {
    bool _outlineButton = outlineButton ?? false;
    bool _isLoading = isLoading ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineButton ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8),
        child: Stack(
            children: [
              Visibility(
                visible: _isLoading?false:true,
                child: Center(
                  child: Text(
                      text ?? "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: _outlineButton ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
              ),
              Visibility(
                visible: _isLoading,
                child: Center(
                  child: SizedBox(
                    height: 30 ,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}

