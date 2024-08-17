import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/service/get_hotels_service.dart';
import 'package:project1univ/service/search_hotel_service.dart';
import 'package:project1univ/widgets/hotel_widget.dart';

class FutureBuilderHotel extends StatelessWidget {
  FutureBuilderHotel({super.key});
  
  final TextEditingController searchHotelController = TextEditingController();
  final TextEditingController countryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchHotelController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: S.of(context).Enter_Hotel_Name,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: countryNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: S.of(context).Enter_country_name,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(
                  Icons.search, // Use a super icon here
                  color: Color.fromARGB(255, 146, 192, 157),
                ),
                onPressed: () {
                  SearchHotelService().searchHotelService(
                    searchHotelController.text,
                    countryNameController.text,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FutureBuilder(
              future: GetHotelsService().gethotelservice(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text(S.of(context).something_went_wrong),
                  );
                } else if (snapshot.hasData) {
                  final hotelList = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: hotelList.length,
                    itemBuilder: (context, index) {
                      final hotel = hotelList[index];
                      return HotelWidget(hotel: hotel);
                    },
                  );
                } else {
                  return const Center(
                    child: Text("no_data_available"),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
