import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/main.dart';
import 'package:project1univ/models/SearchAirplaneModel.dart';
import 'package:project1univ/pages/tripswithcompany.dart';

class Searchairplaneservice {
  Future<SearchAirplaneModel?> Searchairplane(
    String airplaneyName,
    BuildContext context,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutAirPlaneCompany"),
        body: {
          "nameOfCompany": airplaneyName,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        SearchAirplaneModel searchairplanebyname =
            SearchAirplaneModel.fromjson(data);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(searchairplanebyname.data.name),
              content: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(searchairplanebyname.data.photo),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      // Positioned(
                      //     top: 190,
                      //     right: BorderSide.strokeAlignCenter,
                      //     child: searchairplanebyname.data!.Rate == "High"
                      //         ? Icon(
                      //             Icons.favorite,
                      //             color: Colors.red,
                      //           )
                      //         : Text(
                      //             "${searchairplanebyname.data.location}",
                      //             style: TextStyle(
                      //               fontSize: 15,
                      //               color: Colors.white,
                      //             ),
                      //           )),
                      Positioned(
                          top: 250,
                          left: 75,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TripsWithAirplane(
                                          airplaneforsearchtrip:
                                              searchairplanebyname.data.name),
                                    ));
                              },
                              child:  Text("${S.of(context).Trips}")))
                    ],
                  )),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
        return searchairplanebyname;
            } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Failed to search for the airplane."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
        return null;
      }
    } catch (e) {
      print("فات عال catch: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content:
                const Text("An error occurred while searching for the airplane."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }
    return null;
  }
}
