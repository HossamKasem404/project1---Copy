import 'package:flutter/material.dart';
import 'package:project1univ/pages/Getallsearchedtripsdetailes.dart';
import 'package:project1univ/pages/reservetrip.dart';

class TripsInSearch extends StatelessWidget {
   var trip;
var triplist ;
  TripsInSearch({super.key, required this.trip,required this.triplist});

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   backgroundColor: Color.fromARGB(255, 150, 169, 179),
    //   body: GestureDetector(
    //     onTap: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => ReserveTrip(
    //               tripID: trip.id,
    //             ),
    //           ));
    //     },
    //     child: Container(
    //       width: 200,
    //       height: 300,
    //       // decoration: BoxDecoration(
    //       //   image: DecorationImage(
    //       //     image: NetworkImage(country.),
    //       //     fit: BoxFit.cover,
    //       //   ),
    //       //   borderRadius: BorderRadius.circular(50),
    //       // ),
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             top: 15,
    //             left: 18,
    //             child: Text(
    //               "${trip.amountpeople}",
    //               style: TextStyle(color: Colors.white, fontSize: 25),
    //             ),
    //           ),
    //           Positioned(
    //             top: 20,
    //             left: 18,
    //             child: Text(
    //               "${trip.companyName}",
    //               style: TextStyle(color: Colors.white, fontSize: 25),
    //             ),
    //           ),
    //           Positioned(
    //               top: 40,
    //               left: 18,
    //               child:
    //                   ElevatedButton(onPressed: () {}, child: Text("hamed"))),
    //           // Positioned(
    //           //     top: 190,
    //           //     right: BorderSide.strokeAlignCenter,
    //           //     child: country.rate == "High"
    //           //         ? Icon(
    //           //             Icons.favorite,
    //           //             color: Colors.red,
    //           //           )
    //           //         : Text(
    //           //             "Not Recommended ",
    //           //             style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Pacifico"),
    //           //           )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
           
      
    Card(
            color:  const Color.fromARGB(255, 11, 173, 176),
            elevation: 16,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 1500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.asset(
                         "images/sfarway_logo.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Trip Place : ${trip.tripplace}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Twords : ${trip.towards}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Tima Trip : ${trip.timetrip}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Price : ${trip.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Amount of people  : ${trip.amountofpeople}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GetAllSearchedTripsDetailes(tripdetails: triplist)
                                        ),
                                      );
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 138, 126, 101),
                                      ),
                                    ),
                                    child: const Text("Details"),
                                  ),
                                  const SizedBox(width: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ReserveTrip(
                                            tripID: trip.id,
                                          ),
                                        ),
                                      );
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 138, 126, 101),
                                      ),
                                    ),
                                    child: const Text("Reservation"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );}
     
  }
