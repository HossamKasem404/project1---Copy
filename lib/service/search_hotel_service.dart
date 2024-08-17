import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1univ/main.dart';
import 'package:project1univ/models/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/pages/Hotels_In_Search_page.dart';

class SearchHotelService {
  Future<List<HotelModel>?> searchHotelService(
      String hotelName, String countryName, BuildContext context) async {
  
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutHotel"),
        body: {
          "nameOfCountrey": countryName,
          "nameOfHotel": hotelName,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("hamed is legend");
          
        List<HotelModel> hotels = [];
         for (var hotel in data["data"]) {
          hotels.add(HotelModel.fromJson(hotel));
       Navigator.push(context, MaterialPageRoute(builder: (context) => Hotel_In_Search_page(hotels: hotels,)));
        
        
        return hotels;
      }
    } else{
      return 
     showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Oops"),
              content: const Text("Didnt found"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          });}
      return null;
    }
  
}
