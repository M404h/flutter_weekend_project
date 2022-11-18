import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homeScreen_id';
  @override
  Widget build(BuildContext context) {

    final travelsProvider = ChangeNotifierProvider((ref) => TravelsData(),);
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
            Consumer(builder: (context, ref, child) {
              final travels = ref.watch(travelsProvider);
              return ListView.builder(
                itemCount: ,
                itemBuilder: (context, index) {
                  final travel = travels[index];

                 
                  return Container(Text())
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
