import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/service/searchtripviacountryorcomapnyservice.dart';
import 'package:project1univ/widgets/searchtripwidget.dart';

class TripsWithAirplane extends StatelessWidget {
  const TripsWithAirplane({super.key, required this.airplaneforsearchtrip});
  final String airplaneforsearchtrip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 173, 176),
        title:  Center(child: Text("${S.of(context).Trips_In_This_Company}")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 4, left: 4),
        child: FutureBuilder(
          future: Searchtripviacountryorcompanyservice()
              .searchTripViaCountryOrCompanyService(airplaneforsearchtrip),
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
              final tripList = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: tripList.data.length,
                itemBuilder: (context, index) {
                  final trips = tripList.data[index];
                  return SearchTripwidget(searchwidget: trips,tripsdetailes: tripList.data[index],);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
