import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/get_trip_model.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/service/reservetripeservice.dart';

// ignore: must_be_immutable
class ReserveTrip extends StatelessWidget {
  ReserveTrip({super.key, this.tripforreserve});
  TripData? tripforreserve;
  static String id = "ReserveTrip";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fathernamecontroller = TextEditingController();
  TextEditingController mothernamecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController flightclasscontroller = TextEditingController();
  TextEditingController wightcontroller = TextEditingController();
  TextEditingController amountofpeoplecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 173, 176),
          title: const Text("Reserve Your Trips"),
        ),
        body: Column(
          children: [
            TextField(
              controller: emailcontroller,
            ),
            TextField(
              controller: fathernamecontroller,
            ),
            TextField(
              controller: mothernamecontroller,
            ),
            TextField(
              controller: gendercontroller,
            ),
            TextField(
              controller: flightclasscontroller,
            ),
            TextField(
              controller: wightcontroller,
            ),
            TextField(
              controller: amountofpeoplecontroller,
            ),
            ElevatedButton(
                onPressed: () {
                   showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("هل تريد الدغع الان"),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        ReserveTripService().reservetripservice(
                      tripforreserve!.id,
                      emailcontroller.text,
                      fathernamecontroller.text,
                      mothernamecontroller.text,
                      gendercontroller.text,
                      flightclasscontroller.text,
                      int.parse(wightcontroller.text),
                      int.parse(amountofpeoplecontroller.text),
                      context
                      );
                      
                      }, child: const Text("نعم")),
                       ElevatedButton(onPressed: (){
                        
                        Navigator.pushNamed(context, HomePage.id);
                       }, child: const Text("لا"))
                    ],
                  )
                  
                ],
              ),
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
                },
                child:  Text(S.of(context).Reserve))
          ],
        ));
  }
}
