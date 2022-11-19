import 'dart:collection';

import 'package:flutter/material.dart';

import 'Classes/travel.dart';

class TravelsData extends ChangeNotifier {
  List<Travel> _travels = [
    // Travel(
    //   country: 'Saudi Arabia',
    //   resturantExpenses: 20,
    //   flightExpenses: 10,
    //   enterntainmentExpenses: 70,
    //   budget: 5000,
    // ),
    // Travel(
    //   country: 'Saudi Arabia',
    //   resturantExpenses: 20,
    //   flightExpenses: 10,
    //   enterntainmentExpenses: 70,
    //   budget: 5000,
    // ),
    // Travel(
    //   country: 'Saudi Arabia',
    //   resturantExpenses: 20,
    //   flightExpenses: 10,
    //   enterntainmentExpenses: 70,
    //   budget: 5000,
    // ),
  ];

  UnmodifiableListView<Travel> get travels {
    return UnmodifiableListView(_travels);
  }

  addTravel(Travel travel) {
    _travels.add(travel);
    notifyListeners();
  }

  deleteTravel(Travel travel) {
    _travels.remove(travel);
    notifyListeners();
  }
}
