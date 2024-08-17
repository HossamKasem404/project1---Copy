import 'package:flutter/material.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:project1univ/service/get_reserve_trips_service.dart';

class GetTripProvider with ChangeNotifier {
  List<Tripinfo>? _tripdata;

  List<Tripinfo>? get tripdata => _tripdata;

  // Method to delete a trip from the list
  void deleteTripFromList(int tripId) {
    _tripdata?.removeWhere((trip) => trip.id == tripId);
    notifyListeners();
  }

  // Method to fetch reserved trips
  Future<void> fetchReservedTrips() async {
    try {
      _tripdata = await GetReserveTrips().getReservedTrips();
      notifyListeners();
    } catch (e) {
      print("Exception fetching reserved trips: $e");
      // Optionally handle the exception
    }
  }
}
