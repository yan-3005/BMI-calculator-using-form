//OUR OWN CUSTOMISED BUTTON WIDGET


import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//DETECTS GESTURES ON THE SCREEN (BUTTON IN THIS CASE)
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.yellow,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(6),
        height: 40,
        width: 50,
      ),
    );
  }
}