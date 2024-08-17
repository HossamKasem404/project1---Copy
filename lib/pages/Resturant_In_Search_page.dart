import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/resturant_model.dart';
import 'package:project1univ/widgets/resturants_in_search_widget.dart';

class ResturantInSearchPage extends StatelessWidget {
  final List<ResturantModel> resturants;

  const ResturantInSearchPage({super.key, required this.resturants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 173, 176),
        title:  Center(child: Text("${S.of(context).Resturants}")),
      ),
      body: ListView.builder(
        itemCount: resturants.length,
        itemBuilder: (context, index) {
          var resturant = resturants[index];
          return Resturant_in_search_widget(resturant: resturant);
        },
      ),
    );
  }
}
