import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/tripdetails.dart';
import 'package:project1univ/pages/update_reserved_trip.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/providers/gettripsprovider.dart';
import 'package:project1univ/service/delete_trip_service.dart';
import 'package:provider/provider.dart';

class AllTrips extends StatefulWidget {
  const AllTrips({super.key});

  @override
  State<AllTrips> createState() => _AllTripsState();
}

class _AllTripsState extends State<AllTrips> {
  @override
  void initState() {
    super.initState();
    context.read<GetTripProvider>().fetchReservedTrips();
    // Show a snackbar when the widget first initializes
    Future.delayed(Duration.zero, () {
       var snackBar = SnackBar(content: Text(S.of(context).Click_to_see_Trip_Details));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  // Method to show delete confirmation dialog
  Future<void> _showDeleteConfirmationDialog(int tripId) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // Prevents closing dialog on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
    title:  Text(S.of(context).Confirm_Deletion),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(S.of(context).Are_you_sure_you_want_to_delete_this_trip),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text(S.of(context).Cancel),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            TextButton(
              child:  Text(S.of(context).Delete),
              onPressed: () async {
                // Call delete service and update UI accordingly
                await Delet_Trips_service().deletetripservice(tripId, context);
                Navigator.of(context).pop(); // Close dialog
                // Fetch the trips again after deletion
                context.read<GetTripProvider>().fetchReservedTrips();
                // Fetch balance data
                context.read<BalanceProvider>().fetchBalanceData();
                 
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetTripProvider>(
      builder: (context, tripProvider, child) {
        if (tripProvider.tripdata == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final trips = tripProvider.tripdata!;
        return Scaffold(
          appBar: AppBar(
            title:  Center(child: Text(S.of(context).All_Trips)),
            backgroundColor: const Color.fromARGB(255, 11, 173, 176),
          ),
          body: ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index].trip;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TripDetails(tripdetails: trip),
                    ),
                  );
                },
                child: Card(
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
                              '${S.of(context).Twords}: ${trip.twords}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${S.of(context).Status}: ${trips[index].status}',
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(trips[index].id);
                          },
                          color: Colors.red,
                        ),
                          IconButton(
                          icon: const Icon(Icons.update),
                          onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateInfoReserveTrip(tripID:trips[index].id ,)));
                        context.read<GetTripProvider>().fetchReservedTrips();
                // Fetch balance data
                context.read<BalanceProvider>().fetchBalanceData();
                       
                          },
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}