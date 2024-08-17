import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1univ/main.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/models/resturant_model.dart';
import 'package:project1univ/pages/Resturant_In_Search_page.dart';

class SearchResturantService {
  Future<List<ResturantModel>?> searchreesturantservice(
      String resturantname, String countryName, BuildContext context) async {
  
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutRestaurant"),
        body: {
          "nameOfCountrey": countryName,
          "nameOfRestaurant": resturantname,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("hamed is legend  : $data");
          
        List<ResturantModel> resturants = [];
         for (var resturant in data["data"]) {
          resturants.add(ResturantModel.fromJson(resturant));
       Navigator.push(context, MaterialPageRoute(builder: (context) => ResturantInSearchPage(resturants: resturants)));
        
        
        return resturants;
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
