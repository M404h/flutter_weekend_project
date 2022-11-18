import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Value',
  hintStyle: TextStyle(color: Colors.white30),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 10.0,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kMainColor),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kMainColor,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          10.0,
        ),
      )),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kMainColor),
      borderRadius: BorderRadius.all(
        Radius.circular(
          10.0,
        ),
      )),
);

const kTextFieldBottomBorder = InputDecoration(
  hintText: 'Task Name',
  hintStyle: TextStyle(color: Colors.white30),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 10.0,
  ),
  border: OutlineInputBorder(
    // borderSide: BorderSide(color: kMainColor),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.white),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.white),
  ),
);

const kMainColor = Color(0xffedf2fb);
const kSecondaryColor1 = Colors.black;
const kColor1 = Color(0xff51557E);
const kColor2 = Color(0xff787A91);
const kColor3 = Color(0xff273646);
const kSecondaryColor = Color(0xff1e243c);
const kWasSecondaryColor = Color(0xff202c39);
const kSecColor = Colors.white;

const kBottomButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
