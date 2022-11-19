import 'package:cloud_firestore/cloud_firestore.dart';

class Flight {
  final String company;
  final String from;
  final String to;
  final int price;
  final String location;
  final Timestamp date;

  Flight({
    required this.company,
    required this.from,
    required this.to,
    required this.price,
    required this.location,
    required this.date,
  });

  factory Flight.fromFirestore(
    DocumentSnapshot<Map<Object, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final flightData = snapshot.data();
    var flight = Flight(
      company: snapshot.id,
      from: flightData?['from'],
      to: flightData?['from'],
      price: flightData?['price'],
      location: flightData?['location'],
      date: flightData?['date'],
    );
    return flight;
  }
}
