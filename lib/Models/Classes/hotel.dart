import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String name;
  final int price;
  final String location;

  Hotel({
    required this.name,
    required this.price,
    required this.location,
  });

  factory Hotel.fromFirestore(
    DocumentSnapshot<Map<Object, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final hotelData = snapshot.data();
    var hotel = Hotel(
      name: snapshot.id,
      price: hotelData?['price'],
      location: hotelData?['location'],
    );
    return hotel;
  }
}
