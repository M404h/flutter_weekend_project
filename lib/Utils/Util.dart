import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show Image, Picture;

import 'package:intl/intl.dart';

import '../enum/Enums.dart';


Future<void> pushWithAnimation(String routName, BuildContext context,
    {psuhAntimationType? animationType, Object? arguments}) async {
  if (arguments != null) {
    Navigator.pushNamed(context, routName, arguments: arguments);
  } else {
    Navigator.pushNamed(context, routName);
  }
}

Future<void> popWithAnimation(BuildContext context,
    {psuhAntimationType? animationType}) async {
  Navigator.pop(context);
}


