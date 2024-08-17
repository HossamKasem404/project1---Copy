import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/service/getcountries.dart';
import 'package:project1univ/service/searchcountry.dart';
import 'package:project1univ/widgets/countrieswidget.dart';

// ignore: must_be_immutable
class FutureBuilderCountry extends StatefulWidget {
  const FutureBuilderCountry({super.key});

  @override
  State<FutureBuilderCountry> createState() => _FutureBuilderCountryState();
}

class _FutureBuilderCountryState extends State<FutureBuilderCountry> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
       var snackBar =
          SnackBar(content: Text(S.of(context).Click_On_Country_to_see_the_Trips_in_it));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  TextEditingController searchcountrynamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, right: 4, left: 4),
        child: TextField(
          controller: searchcountrynamecontroller,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                SearchCountry()
                    .searchCountry(searchcountrynamecontroller.text, context);
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: S.of(context).Search_by_country_name,
            // hintStyle: TextStyle(fontFamily: "Pacifico")
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
            future: GetCountries().getCountries(),
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
                final countryList = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: countryList.data.length,
                  itemBuilder: (context, index) {
                    final country = countryList.data[index];
                    return CountrWidget(country: country);
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
