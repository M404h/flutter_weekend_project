import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  FirebaseFirestore DB = FirebaseFirestore.instance;
  String userID; // like Firebase auth -- it should be the documentTitle
  String? userName;
  String? userPhoneNumber;

  User(
      {required this.userID,
      this.userName = "BM",
      required this.userPhoneNumber}); //add required to Id  & phone

  User.fromFirestore({required this.userID}) {
    DB.collection("users").doc(userID).get().then((snapshot) {
      final data = snapshot.data();
      userPhoneNumber = data?['phoneNumber'];
      userName = data?["name"];
      print(data?['phoneNumber']);
    });
  }

  Map<String, String> userToMap() => {
        "userID": userID,
      };

// I Should check there is no user with this id??

}
