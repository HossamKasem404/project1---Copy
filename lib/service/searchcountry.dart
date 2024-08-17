import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/main.dart';
import 'package:project1univ/models/searchcountrymodel.dart';
import 'package:project1univ/pages/tripsWithCountry.dart';

class SearchCountry {
  Future<SearchCountryModel?> searchCountry(
    String countryName,
    BuildContext context,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutContrey"),
        body: {
          "name": countryName,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        SearchCountryModel searchcountrybyname =
            SearchCountryModel.fromjson(data);

        if (searchcountrybyname.data != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(searchcountrybyname.data!.name),
                content: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TripsWithCountry(),))
                  },
                  child: Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(searchcountrybyname.data!.photo),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 250,
                              left: 75,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TripsWithCountry(
                                                  countryforsearchtrip:
                                                      searchcountrybyname
                                                          .data!.name),
                                        ));
                                  },
                                  child:  Text(S.of(context).Trips)))
                        ],
                      )),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:  Text(S.of(context).Close),
                  ),
                ],
              );
            },
          );
          return searchcountrybyname;
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Country Not Found"),
                content: const Text("The country you searched for was not found."),
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
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Failed to search for the country."),
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
            content: const Text("An error occurred while searching for the country."),
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
