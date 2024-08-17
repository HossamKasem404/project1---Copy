import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/providers/balanceprovider.dart';

class Pay_For_Trip_Service {
  Future pay_for_trip_service(BuildContext context, int tripId, String email, String phone) async {
    try {
    
      if (tripId <= 0 || email.isEmpty ) {
     //   showErrorDialog(context, 'Invalid input data');
        return;
      }

      http.Response response = await http.post(
        Uri.parse("$url/PayedToTrip"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "idreservetrip": tripId.toString(),
          "email": email,
          "phone": phone
        },
      );

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        BalanceProvider().fetchBalanceData();
        print(responseData);
        print("تم الدفع");

      } else {
  //      showErrorDialog(context, responseData['message']);
        print("Error paying  trip: ${response.statusCode} - $responseData");
      }
    } catch (e) {
  //    showErrorDialog(context, 'An error occurred while processing the payment');
      print('Error paying for trip: $e');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Oops"),
          content: Text(message),
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
}