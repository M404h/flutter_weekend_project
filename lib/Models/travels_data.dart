import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Classes/flight.dart';
import 'Classes/hotel.dart';
import 'Classes/travel.dart';

class TravelsData extends ChangeNotifier {
  List<Travel> _travels = [
    Travel(
        country: 'Dubai',
        resturantExpenses: 20,
        flightExpenses: 10,
        enterntainmentExpenses: 20,
        budget: 5000,
        hotelExpenses: 50),
    Travel(
      country: 'Dammam',
      resturantExpenses: 10,
      flightExpenses: 20,
      enterntainmentExpenses: 70,
      budget: 3000,
    ),
    Travel(
      country: 'Tokyo',
      resturantExpenses: 20,
      flightExpenses: 10,
      enterntainmentExpenses: 70,
      budget: 10000,
    ),
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

  static final DB = FirebaseFirestore.instance;

  static List<Hotel> hotels = [];

  static Future getHotels() async {
    await DB.collection('Cities/Dubai/Hotels').get().then((snapshot) {
      snapshot.docs.forEach((snapshot) {
        hotels.add(Hotel.fromFirestore(snapshot, null));
      });
    });
    print(hotels);
  }

  static List<Flight> flights = [];

  static Future getFlights() async {
    await DB.collection('Cities/Dubai/Flights').get().then((snapshot) {
      snapshot.docs.forEach((snapshot) {
        flights.add(Flight.fromFirestore(snapshot, null));
      });
    });
    print(flights);
  }
}
