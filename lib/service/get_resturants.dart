import 'dart:convert';

import 'package:project1univ/main.dart';
     import 'package:http/http.dart' as http;
import 'package:project1univ/models/resturant_model.dart';

class GetResturantsService{
  Future<List<ResturantModel>> getresturantsservice() async{
    try {
      http.Response response = await http.get(
        Uri.parse("$url/getrestaurantforclient"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        
        var responseData = jsonDecode(response.body);
        
        List<ResturantModel> resturants = [];
         for (var resturant in responseData["data"]) {
          resturants.add(ResturantModel.fromJson(resturant));
        }
        
        return resturants;
       
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}

  