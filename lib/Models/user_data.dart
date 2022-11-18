import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//?v
import 'package:flutter/foundation.dart';
import 'Classes/user.dart' as Safrati;

class UserData extends ChangeNotifier {
  static final FirebaseFirestore DB = FirebaseFirestore.instance;

  static late Safrati.User user;

  UserData();
  UserData.create({
    required String userID,
    required userName,
    required userPhoneNumber,
  }) {
    user = Safrati.User(
      userID: userID,
      userName: userName,
      userPhoneNumber: userPhoneNumber,
    );
  }
}
