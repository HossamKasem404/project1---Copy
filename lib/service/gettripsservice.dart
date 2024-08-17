import 'dart:convert';
import 'package:project1univ/main.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/models/gettripmodel.dart';

class GetTrips {
  Future<TripModel?> gettrips() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/gettripclient"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("فات عرد الرحلة $responseData");

        return TripModel.fromJson(responseData);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
