import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend_project/Screens/TravelHome.dart';
import 'package:flutter_weekend_project/constants.dart';
import 'package:flutter_weekend_project/Models/travels_data.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homeScreen_id';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    TravelsData.getFlights();
    TravelsData.getHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final travelsProvider = ChangeNotifierProvider(
      (ref) => TravelsData(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Trips",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer(builder: (context, ref, child) {
              final travels = ref.watch(travelsProvider).travels;
              return travels.isNotEmpty
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: travels.length,
                      itemBuilder: (context, index) {
                        final travelsItem = travels[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              TravelHome.id,
                              arguments: {
                                "country": travelsItem.country,
                                "Hotels": travelsItem.hotelExpenses,
                                "resturantExpenses":
                                    travelsItem.resturantExpenses,
                                "flightExpenses": travelsItem.flightExpenses,
                                "enterntainmentExpenses":
                                    travelsItem.enterntainmentExpenses,
                                "budget": travelsItem.budget,
                              },
                            );
                          },
                          child: Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          travelsItem.country,
                                          style: TextStyle(
                                              color: titleColor, fontSize: 20),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      "\$${travelsItem.budget}",
                                      style: TextStyle(
                                          color: lightColor, fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    travelsItem.flightExpenses != null
                                        ? Row(
                                            children: [
                                              Image.asset("images/plane.png",
                                                  height: 20,
                                                  color: lightColor),
                                              Text(
                                                  " ${travelsItem.flightExpenses.toString()}")
                                            ],
                                          )
                                        : Container(),
                                    travelsItem.hotelExpenses != null
                                        ? Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Image.asset("images/hotel.png",
                                                  height: 20,
                                                  color: lightColor),
                                              Text(
                                                  " ${travelsItem.hotelExpenses.toString()}")
                                            ],
                                          )
                                        : Container(),
                                    travelsItem.resturantExpenses != null
                                        ? Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Image.asset("images/dish.png",
                                                  height: 20,
                                                  color: lightColor),
                                              Text(
                                                  " ${travelsItem.resturantExpenses.toString()}")
                                            ],
                                          )
                                        : Container(),
                                    travelsItem.enterntainmentExpenses != null
                                        ? Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Image.asset("images/gift.png",
                                                  height: 20,
                                                  color: lightColor),
                                              Text(
                                                  " ${travelsItem.enterntainmentExpenses.toString()}")
                                            ],
                                          )
                                        : Container()
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
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 250),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You dont have any trip yet",
                              style:
                                  TextStyle(color: titleColor, fontSize: 20)),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.pushReplacementNamed(
                                  context, TravelHome.id)
                            },
                            child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 3,
                                    color: lightColor,
                                  )),
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: lightColor,
                                    ),
                                    Text(
                                      'Add a trip',
                                      style: TextStyle(
                                          color: lightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
