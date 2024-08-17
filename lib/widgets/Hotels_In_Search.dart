import 'package:flutter/material.dart';
import 'package:project1univ/models/hotel_model.dart';
import 'package:project1univ/widgets/hotel_widget.dart';

class Hotels_In_Search extends StatelessWidget {
   Hotels_In_Search({super.key,required this.hotels});
List<HotelModel> hotels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,       
      itemBuilder: (context, index) {
        var hotel = hotels[index];
        return HotelWidget(hotel: hotel);
      },
    
    
    
    
    );
  }
}