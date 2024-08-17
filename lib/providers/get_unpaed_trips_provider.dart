
import 'package:flutter/material.dart';
import 'package:project1univ/models/trip_model.dart';
import 'package:project1univ/service/get_unpayed_trips_service.dart';
import 'package:project1univ/service/pay_for_trip_service.dart';
class GetUnPayedTripProvider with ChangeNotifier {
  List<Tripinfo>? _unpayedtripdata;

  List<Tripinfo>? get unpayedtripdata => _unpayedtripdata;

  
  Future<void> fetchUnPayedTrips(BuildContext context) async {
    _unpayedtripdata = await GetUnPayedTrips().getunpayedtrips(context);
    notifyListeners();
  }
  Future<void> payForTrip( context,int tripId, String email, String phone) async {
  
     await Pay_For_Trip_Service().pay_for_trip_service(context, tripId, email, phone); 
 
     
    // Update the UI or perform any other necessary actions after a successful payment

}
}