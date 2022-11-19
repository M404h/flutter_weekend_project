import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/Screens/BudgetDivider.dart';
import 'package:flutter_weekend_project/Screens/HomeScreen.dart';
import 'package:flutter_weekend_project/Screens/TravelHome.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';
import 'package:flutter_weekend_project/widgets/CustomAppBar.dart';

class CategoryDetailsManual extends StatelessWidget {
  static String id = 'CategoryDetailsManualScreen_id';
  @override
  Widget build(BuildContext context) {
    final categoryObject = ModalRoute.of(context)!.settings.arguments as Map;
    final travelsProvider = ChangeNotifierProvider(
      (ref) => TravelsData(),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: lightColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: (() => {})),
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: budget_manaul.length,
                itemBuilder: (context, index) {
                  final budget = budget_manaul[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: 75,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              budget["date"],
                              style: TextStyle(color: titleColor, fontSize: 15),
                            ),
                            Text(
                              "- \$${budget["amount"]}",
                              style: TextStyle(color: lightColor, fontSize: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List budget_manaul = [
    {"amount": "20", "date": "09 Oct 2022"},
    {"amount": "10", "date": "12 Sep 2022"},
    {"amount": "30", "date": "05 Aug 2022"},
    {"amount": "10", "date": "01 Aug 2022"},
  ];
}
