import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/providers/gettripsprovider.dart';
import 'package:provider/provider.dart';

class Delet_Trips_service {
  Future deletetripservice(int tripId, BuildContext context) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/DeleteReserveTrip"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "idTrip": tripId.toString(),
        },
      );

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Update the provider to remove the deleted trip from the list
        context.read<GetTripProvider>().deleteTripFromList(tripId);
      } else {
        // Show error dialog if deletion fails
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Oops"),
              content: Text("${responseData['message']}"),
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
        print("Error deleting trip: ${response.statusCode} - ${responseData['message']}");
      }
    } catch (e) {
      print("Exception occurred: $e");
      // Handle exceptions if necessary
    }
  }
}
