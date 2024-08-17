import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/trip_model.dart';

class GetUnPayedTrips {
  Future<List<Tripinfo>> getunpayedtrips(BuildContext context) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/getunpayedtrip"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        print("Successfully fetched unpayed trips");
        var responseData = jsonDecode(response.body);
        List<Tripinfo> trips = [];
        for (var trip in responseData["data"]) {
          trips.add(Tripinfo.fromJson(trip));
        }
        return trips;
      } else {
        print("Error fetching unpayed trips: ${response.statusCode}");
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Oops"),
  //         content: Text("There arent any reserved trips"),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text("Close"),
  //           ),
  //         ],
  //       );
  //     },
                      return []; // Return an empty list to avoid stopping the application
      }
    } on Exception {
      return []; // Return an empty list to avoid stopping the application
    }
  }}

//   void showErrorDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }