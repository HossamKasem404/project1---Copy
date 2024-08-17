import 'package:flutter/material.dart';
import 'package:project1univ/service/searchtripviacountryorcomapnyservice.dart';
import 'package:project1univ/widgets/tripsinsearch.dart';
class SearchTrippage extends StatelessWidget {
   SearchTrippage({super.key, required this.searchtripviacountryorairplane});
 TextEditingController searchtripviacountryorairplane ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
            future:  Searchtripviacountryorcompanyservice().searchTripViaCountryOrCompanyService(
                              searchtripviacountryorairplane.text),
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
                var  tripsList = snapshot.data!;
                print(tripsList);
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
                    print( trips.towards);
                    return TripsInSearch(trip: trips, triplist: tripsList.data[index],);
                  },
                );
              }
              return Container();
            },
          ),
        ),
      )
    ]));
  }
}
//
  