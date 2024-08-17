import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/hotel_model.dart';
import 'package:project1univ/widgets/hotel_widget.dart';

class Hotel_In_Search_page extends StatelessWidget {
   Hotel_In_Search_page({super.key,required this.hotels});
List<HotelModel> hotels ;
  @override
  Widget build(BuildContext context) {
 var hotel = hotels[0];
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 146, 192, 157),
        title:  Center(child: Text("${S.of(context).Hotels}")),
      ),
body:HotelWidget(hotel: hotel),
    );
  }
}