import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:http/http.dart' as http;

class GetReserveTrips {
  Future<List<Tripinfo>> getReservedTrips() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/GetReserveTrip"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<Tripinfo> trips = [];
        for (var trip in responseData["data"]) {
          trips.add(Tripinfo.fromJson(trip));
        }
        return trips;
      } else {
        print("Error fetching reserved trips: ${response.statusCode}");
        // Optionally, return an empty list or handle gracefully
        return [];
      }
    } catch (e) {
      print("Exception occurred: $e");
      // Optionally, return an empty list or handle gracefully
      return [];
    }
  }
}
