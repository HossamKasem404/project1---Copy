import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/airplanemodel.dart';

class GetAirplancompany {


  Future<AirplaneModel> getAirpalncompany() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$url/GetAirPlanesCompany'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("فات عرد الشركة $responseData");
        return AirplaneModel.fromJson(responseData);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
