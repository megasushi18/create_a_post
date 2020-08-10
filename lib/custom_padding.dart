import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {

  final Function onPressed;
  final Color colorBox;
  final Color colorText;
  final String text;
  final double width;

  CustomPadding({this.onPressed, this.colorBox, this.colorText, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0,),
      child: Material(
        color: colorBox,
        borderRadius: BorderRadius.circular(30.0),
        child: SizedBox(
          height: 20.0,
          width: width,
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                  color: colorText,
                  fontSize: 12.0,
                )),
          ),
        ),
      ),
    );
  }
}
