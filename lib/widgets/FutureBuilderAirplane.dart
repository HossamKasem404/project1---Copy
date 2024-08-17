import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/service/SearchAirplane.dart';
import 'package:project1univ/service/get_airplancompany.dart';
import 'package:project1univ/widgets/AirplaneWidget.dart';

// ignore: must_be_immutable
class FutureBuilderAirplane extends StatefulWidget {
  const FutureBuilderAirplane({super.key});

  @override
  State<FutureBuilderAirplane> createState() => _FutureBuilderAirplaneState();
}

class _FutureBuilderAirplaneState extends State<FutureBuilderAirplane> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
       var snackBar = SnackBar(
          content: Text(
              S.of(context).Click_once_to_see_company_details_and_twice_to_see_trips_within_the_company));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  TextEditingController searchairplanenamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 4, left: 4),
          child: TextField(
            controller: searchairplanenamecontroller,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Searchairplaneservice().Searchairplane(
                      searchairplanenamecontroller.text, context);
                },
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: S.of(context).Search_by_Airplane_company_name,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 4, left: 4),
            child: FutureBuilder(
              future: GetAirplancompany().getAirpalncompany(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print('يحتوي بيب سبيرسي');

                  return const Text("something went wrong");
                }
                if (snapshot.hasData) {
                  print('يحتوي داتا');
                  final companyList = snapshot.data!;
                  print("1");
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: companyList.data.length,
                    itemBuilder: (context, index) {
                      var airplane = companyList.data[index];
                      print("2");
                      return Airplanewidget(airplane: airplane ,);
                    },
                  );
                } else {
                  print('  يحتوي  لا داتا');
                }

                return Container();
              },
            ),
          ),
        )
      ],
    );
  }
}
