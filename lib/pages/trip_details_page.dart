import 'package:flutter/material.dart';

class TripDetails extends StatelessWidget {
  final List<dynamic> tripdetails;

  const TripDetails({super.key, required this.tripdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Center(child: Text('Reservation Details')),
            backgroundColor: const Color.fromARGB(255, 11, 173, 176),
          ),
      body: ListView.builder(
        itemCount: tripdetails.length,
        itemBuilder: (context, index) {
          var trip = tripdetails[index].trip;
          return Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.blue),
                    title: Text(
                      'Towards: ${trip.towards}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.attach_money, color: Colors.green),
                    title: Text(
                      'Price: \$${trip.price}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.people, color: Colors.orange),
                    title: Text(
                      'Amount of people in trip: ${trip.amountofpeopleinttrip}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time, color: Colors.red),
                    title: Text(
                      'Time of trip: ${trip.timetrip}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: Text(
                      'Father name: ${tripdetails[index].fathername}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
