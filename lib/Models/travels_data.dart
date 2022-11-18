import 'dart:collection';

import 'package:flutter/material.dart';

import 'Classes/travel.dart';

class TravelsData extends ChangeNotifier {
  List<Travel> _travels = [
    Travel(country: 'SA', expenses: {'resturants': '3000'}),
    Travel(country: 'SA', expenses: {'resturants': '3000'}),
    Travel(country: 'SA', expenses: {'resturants': '3000'}),
  ];

  UnmodifiableListView<Travel> get travels {
    return UnmodifiableListView(_travels);
  }

  addTravel(Travel travel) {
    _travels.add(travel);
  }

  deleteTravel(Travel travel) {
    _travels.remove(travel);
  }
}
