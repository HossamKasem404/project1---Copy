import 'package:flutter/material.dart';
import 'package:project1univ/service/gettripsservice.dart';
import 'package:project1univ/widgets/tripswidget.dart';

class FutureBuilderTrip extends StatelessWidget {
  const FutureBuilderTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
            future: GetTrips().gettrips(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                print(snapshot.data);
                return const Text("something went wrong");
              }
              if (snapshot.hasData) {
                final tripsList = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: tripsList.data.length,
                  itemBuilder: (context, index) {
                    final trips = tripsList.data[index];
                    return TripsWidget(trip: trips);
                  },
                );
              }
              return Container();
            },
          ),
        ),
      )
    ]);
  }
}
