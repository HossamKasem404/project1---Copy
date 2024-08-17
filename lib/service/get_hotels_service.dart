import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/hotel_model.dart';
     import 'package:http/http.dart' as http;

class GetHotelsService{
  Future<List<HotelModel>> gethotelservice() async{
    try {
      http.Response response = await http.get(
        Uri.parse("$url/gethotelsforclient"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        
        var responseData = jsonDecode(response.body);
        
        List<HotelModel> hotels = [];
         for (var hotel in responseData["data"]) {
          hotels.add(HotelModel.fromJson(hotel));
        }
        
        return hotels;
       
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}

  