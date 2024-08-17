import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/countrymodel.dart';
import 'package:http/http.dart' as http;

class GetCountries {
  

  Future<CountryModel?> getCountries() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/ReturnCountrey"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("فات عرد البلد $responseData");
        
        return CountryModel.fromJson(responseData);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}