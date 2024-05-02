import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'common_widget.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.buttonColor,
    required this.radios,
    required this.onTap,
    this.height,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color? buttonColor;
  final double? height;
  final double? radios;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: buttonColor, //button's fill color
        backgroundColor: buttonColor, //button's fill color
        shadowColor: Colors.black, //specify the button's elevation color
        side: BorderSide(color: buttonColor!, width: 2.0, style: BorderStyle.solid), //set border for the button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radios!)), // set the buttons shape. Make its birders rounded etc
      ),
      child: MediumText(text, 15, color, TextAlign.center),
    );
  }
}

