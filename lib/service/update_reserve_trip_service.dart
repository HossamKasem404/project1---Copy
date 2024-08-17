import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:project1univ/main.dart";
import "package:project1univ/pages/all_trips_page.dart";
import "package:project1univ/pages/homepage.dart";

class UpdateInfoReserveTripService {
  Future updateinforeservetripservice(
      String id ,
      
      String fathername,
      String mothername,
      String gender,
      String flightclass,
      String wight,
      String amountofpeople,
      BuildContext context) async {
    http.Response response =
        await http.post(Uri.parse("http://10.0.2.2:8000/api/UpdateInfoReserve"), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "reserveId": "$id",
      
      "newfatherName": fathername?? "",
      "newMotherName": mothername?? "",
      "newGendor": gender?? "",
      "newFlightClass": flightclass?? "",
      "newWight": wight?? "",
      "newamountpeople": amountofpeople?? ""
    });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if  (response.statusCode==200){
      print("فات على عملية التعديل و عدل ");
      
 Navigator.of(context).pop(); 
        showDialog(
        
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${responseData["Message"]}"),
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
    }else{
      print("ما فات على التعديل");
       showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${responseData["Message"]}"),
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
}
