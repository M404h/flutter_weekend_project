import 'package:flutter/material.dart';
import 'package:flutter_weekend_project/constants.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homeScreen_id';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Travels'),
        elevation: 10,
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        color: kSecondaryColor,
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
