import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/pay_for_trips_page.dart';
import 'package:project1univ/pages/trip_details_page.dart';
import 'package:project1univ/providers/get_unpaed_trips_provider.dart';
import 'package:provider/provider.dart';

class UnpayedTripsPage extends StatefulWidget {
  const UnpayedTripsPage({super.key});

  @override
  State<UnpayedTripsPage> createState() => _UnpayedTripsPageState();
}

class _UnpayedTripsPageState extends State<UnpayedTripsPage> {
   final _provider = GetUnPayedTripProvider();

  @override
  void initState() {
    super.initState();
 _provider.fetchUnPayedTrips(context);
     Future.delayed(Duration.zero, () {
       var snackBar = SnackBar(content: Text(S.of(context).Click_to_see_Trip_Details));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    return ChangeNotifierProvider(
       create: (_) => _provider,
      child: Consumer<GetUnPayedTripProvider>(
        builder: (context, tripProvider, child) {
          if (tripProvider.unpayedtripdata == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final trips = tripProvider.unpayedtripdata!;
          return Scaffold(  appBar: AppBar(
            title:  Center(child: Text(S.of(context).My_UnPaid_Trips)),
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
                        builder: (context) => TripDetails(tripdetails: trips),
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
                                '${ S.of(context).Twords}: ${trip.towards}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${ S.of(context).Price}: \$${trip.price}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayForTripsPage(tripid: trips[index].id),
                      ),
                    );
                    setState(() {
                      
                    });
                            },
                            icon: const Icon(FontAwesomeIcons.dollarSign , color: Color.fromARGB(255, 146, 192, 157),),
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
      ),
    );
  }
}