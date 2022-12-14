import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/Screens/BudgetDivider.dart';
import 'package:flutter_weekend_project/Screens/HomeScreen.dart';
import 'package:flutter_weekend_project/Screens/TravelHome.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Classes/flight.dart';
import '../Models/Classes/hotel.dart';

class CategoryDetails extends StatefulWidget {
  static String id = 'CategoryDetailsScreen_id';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    final categoryObject = ModalRoute.of(context)!.settings.arguments as Map;
    final travelsProvider = ChangeNotifierProvider(
      (ref) => TravelsData(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
                      categoryObject['category'],
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                height: 110,
                margin: EdgeInsets.all(8),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: lightColor, shape: BoxShape.circle),
                          child: Center(
                            child: Image.asset(
                              categoryObject["icon"],
                              height: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("\$${categoryObject['budget']}",
                              style: TextStyle(
                                color: lightColor,
                                fontSize: 24,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TravelsData.hotels.length > 0
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: TravelsData.hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = TravelsData.hotels[index];
                        return Container(
                          padding: EdgeInsets.all(20),
                          height: 110,
                          margin: EdgeInsets.all(8),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //         Container(
                                  //               width: 50,
                                  // height: 50,
                                  // decoration: const BoxDecoration(
                                  //     color: Colors.white, shape: BoxShape.circle),
                                  //               child: Center(
                                  //                 child: Image.asset(category["icon"],
                                  //                  height: 30,
                                  //                  color: lightColor,),
                                  //               ),
                                  //             ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/hotel.png',
                                        height: 30,
                                        color: lightColor,
                                      ),
                                      Text(
                                        "  " + hotel.name,
                                        style: TextStyle(
                                            color: titleColor, fontSize: 20),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "\$${hotel.price.toString()}",
                                    style: TextStyle(
                                        color: lightColor, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  final List budget_category = [
    {"category": "Air Tickets", "budget": 2000, "icon": "images/plane.png"},
    {"category": "Hotels", "budget": 1500, "icon": "images/hotel.png"},
    {"category": "Food", "budget": 500, "icon": "images/dish.png"},
    {
      "category": "Gifts",
      "budget": 500,
      "icon": "images/gift.png",
    },
  ];
}
