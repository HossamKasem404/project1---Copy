import 'package:flutter/material.dart';
import 'package:project1univ/widgets/FutureBuilderAirplane.dart';
import 'package:project1univ/widgets/future_builder_hotel.dart';
import 'package:project1univ/widgets/futurebuidertripinhomepage.dart';
import 'package:project1univ/widgets/futurebuilder_resturants.dart';
import 'package:project1univ/widgets/futurebuildercountry.dart';

class TabBarViewHomePage extends StatelessWidget {
  const TabBarViewHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Container(
        child: Container(child: const FutureBuilderTrip()),
      ),
      Container(
        child:Container(
          child: FutureBuilderResturants(),
        )
      ),
      Container(
        child: FutureBuilderHotel()
      ),
      Container(
          decoration: const BoxDecoration(
            
          ),
          child: const FutureBuilderAirplane()),
      Container(
          decoration:  BoxDecoration(
           
          ),
          child:  FutureBuilderCountry()),
    ]);
  }
}
