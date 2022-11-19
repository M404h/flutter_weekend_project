import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/Screens/BudgetDivider.dart';
import 'package:flutter_weekend_project/Screens/CategoryDetails.dart';
import 'package:flutter_weekend_project/Screens/CategoryDetailsManual.dart';
import 'package:flutter_weekend_project/Screens/HomeScreen.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';
import 'package:flutter_weekend_project/widgets/CustomAppBar.dart';

import '../Models/Classes/flight.dart';
import '../Models/Classes/hotel.dart';

class TravelHome extends StatefulWidget {
  static String id = 'travelHomeScreen_id';

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  @override
  Widget build(BuildContext context) {
    final trips = ModalRoute.of(context)!.settings.arguments as Map;
    final travelsProvider = ChangeNotifierProvider(
      (ref) => TravelsData(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
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
                      "Home",
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
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person, size: 40, color: lightColor),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Welcome Abdullah",
                          style: TextStyle(
                            color: titleColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 30),
              Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Budget",
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${trips["budget"]}",
                            style: TextStyle(
                              color: lightColor,
                              fontSize: 24,
                            )),
                        IconButton(
                            onPressed: () => {
                                  Navigator.pushReplacementNamed(
                                      context, BudgetDivider.id)
                                },
                            icon: Icon(
                              Icons.edit,
                              size: 24,
                              color: lightColor,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${trips["country"]}",
                            style: TextStyle(
                              color: lightColor,
                              fontSize: 24,
                            )),
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.edit,
                              size: 24,
                              color: lightColor,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: budget_category.length,
                itemBuilder: (context, index) {
                  final category = budget_category[index];
                  return GestureDetector(
                    onTap: () {
                      if (category["category"] == "Air Tickets" ||
                          category["category"] == "Hotels") {
                        Navigator.pushReplacementNamed(
                          context,
                          CategoryDetails.id,
                          arguments: {
                            "category": category["category"],
                            "icon": category["icon"],
                            "budget": category["budget"]
                          },
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          CategoryDetailsManual.id,
                          arguments: {
                            "category": category["category"],
                            "icon": category["icon"],
                            "budget": category["budget"]
                          },
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    category["icon"],
                                    height: 30,
                                    color: lightColor,
                                  ),
                                  Text(
                                    "  " + category["category"],
                                    style: TextStyle(
                                        color: titleColor, fontSize: 20),
                                  ),
                                ],
                              ),
                              if (category["category"] == "Air Tickets") ...[
                                Text(
                                  "${trips["flightExpenses"]}\%",
                                  style: TextStyle(
                                      color: lightColor, fontSize: 20),
                                ),
                              ] else if (category["category"] == "Hotels") ...[
                                Text(
                                  "${trips["Hotels"]}\%",
                                  style: TextStyle(
                                      color: lightColor, fontSize: 20),
                                ),
                              ] else if (category["category"] == "Food") ...[
                                Text(
                                  "${trips["resturantExpenses"]}\%",
                                  style: TextStyle(
                                      color: lightColor, fontSize: 20),
                                ),
                              ] else if (category["category"] == "Gifts") ...[
                                Text(
                                  "${trips["enterntainmentExpenses"]}\%",
                                  style: TextStyle(
                                      color: lightColor, fontSize: 20),
                                ),
                              ] else ...[
                                Text("None")
                              ]
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
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
