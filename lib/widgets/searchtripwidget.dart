import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/searchtripviacountryorcompanymodel.dart';
import 'package:project1univ/pages/reservetrip.dart';
import 'package:project1univ/pages/tripdetails.dart';
import 'package:project1univ/providers/gettripsprovider.dart';
import 'package:provider/provider.dart';

class SearchTripwidget extends StatefulWidget {
  final SearchTripDataModel searchwidget;
  final tripsdetailes;

  SearchTripwidget(
      {super.key, required this.searchwidget, required this.tripsdetailes});

  @override
  State<SearchTripwidget> createState() => _SearchTripwidgetState();
}

class _SearchTripwidgetState extends State<SearchTripwidget> {
  @override
  void initState() {
    super.initState();
    context.read<GetTripProvider>().fetchReservedTrips();
    Future.delayed(Duration.zero, () {
       var snackBar = SnackBar(content: Text("${S.of(context).Click_to_see_Trip_Details}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetTripProvider>(builder: (context, tripprovider, child) {
      final trips = tripprovider.tripdata!;
      return Card(
          color:  const Color.fromARGB(255, 11, 173, 176),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.black.withOpacity(0.2),
          child: SizedBox(
              height: 500, // Adjusted to a more practical height
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.asset(
                        "images/sfarway_logo.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        frameBuilder: (BuildContext context, Widget child,
                            int? frame, bool wasSynchronouslyLoaded) {
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${S.of(context).Trip_Place}: ${widget.searchwidget.tripplace}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${S.of(context).Twords}: ${widget.searchwidget.towards}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${S.of(context).Time_Trip}: ${widget.searchwidget.timetrip}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${S.of(context).Price}: \$${widget.searchwidget.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${S.of(context).Amount_of_people}: ${widget.searchwidget.amountofpeople}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TripDetails(
                                      tripdetails: widget.tripsdetailes,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.info),
                              label:  Text("${S.of(context).Details}"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                elevation: 5,
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReserveTrip(
                                      tripID: widget.searchwidget.id,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.calendar_today),
                              label:  Text("${S.of(context).Reservation}"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                elevation: 5,
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )));
    });
  }
}
