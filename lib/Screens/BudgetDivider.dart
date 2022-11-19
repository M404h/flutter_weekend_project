import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/Screens/HomeScreen.dart';
import 'package:flutter_weekend_project/Screens/TravelHome.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';

class BudgetDivider extends StatefulWidget {
  static String id = 'BudgetDividerScreen_id';


  @override
  State<BudgetDivider> createState() => _BudgetDividerState();
}

class _BudgetDividerState extends State<BudgetDivider> {
    TextEditingController? budgetController;
  TextEditingController? airTicketsController;
  TextEditingController? hotelsController;
  TextEditingController? foodController;
  TextEditingController? giftsController;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final travelsProvider = ChangeNotifierProvider(
      (ref) => TravelsData(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, TravelHome.id);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: titleColor,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: Text(
                      "Budget",
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: TextFormField(
                          controller: budgetController,
                          validator: (val) {
                            if (val!.isEmpty)
                              return "cannot leave the budget empty";
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Budget*",
                              labelStyle: TextStyle(fontSize: 14, color: lightColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: TextFormField(
                          controller: airTicketsController,
                          // validator: (val) {
                          //   if (val!.isEmpty)
                          //     return "cannot leave the hotel empty";
                          // },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Air Tickets percentage (%)",
                              labelStyle: TextStyle(fontSize: 14, color: lightColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: TextFormField(
                          controller: hotelsController,
                          // validator: (val) {
                          //   if (val!.isEmpty)
                          //     return "cannot leave the hotel empty";
                          // },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Hotel percentage (%)",
                              labelStyle: TextStyle(fontSize: 14, color: lightColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: TextFormField(
                          controller: foodController,
                          // validator: (val) {
                          //   if (val!.isEmpty)
                          //     return "cannot leave the hotel empty";
                          // },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Food percentage (%)",
                              labelStyle: TextStyle(fontSize: 14, color: lightColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),

                       Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: TextFormField(
                          controller: giftsController,
                          // validator: (val) {
                          //   if (val!.isEmpty)
                          //     return "cannot leave the hotel empty";
                          // },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Gift percentage (%)",
                              labelStyle: TextStyle(fontSize: 14, color: lightColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    SizedBox(height: 40),
                     SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: GestureDetector(
                      onTap: () {  if (_formKey.currentState!.validate()){};},
                    
                        child: Container(
                          padding: EdgeInsets.all(10),
                height: 110,
                margin: EdgeInsets.all(8),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: lightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      blurRadius: 20.0, 
                      spreadRadius: 0.0, 
                      offset: Offset(
                        5.0, 
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Center(child:Text("Save",style: TextStyle(color: Colors.white, fontSize: 20),)),
                         )
                        ),
                      ),
                    
                  
                ),
              ],
            ),
          ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
