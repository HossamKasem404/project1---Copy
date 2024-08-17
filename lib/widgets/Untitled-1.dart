import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripDetails extends StatelessWidget {
   TripDetails({super.key,required this.tripdetails,});
 var tripdetails ;
 
  @override

  Widget build(BuildContext context) {
    var trip = tripdetails[0].trip;
    
    return  Scaffold(
      
      body: Card(
        
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twords: ${trip.twords}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Price: \$${trip.price}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Twords: ${trip.amountofpeopleinttrip}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Twords: ${trip.timetrip}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         Text(
                            'Twords: ${tripdetails[0].fathername}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            
                        ],
                      ),
                     
                    ],
                  ),
                ),
              ),
    );
  }
}