import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/searchpage.dart';

class BottomnavigationBar extends StatelessWidget {
  const BottomnavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcountrynamecontroller = TextEditingController();
    return 
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 11, 173, 176))),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title:  Text(S.of(context).Search_By_Country_OR_FlightCompany),
                    content: TextField(
                      controller: searchcountrynamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      
                        // hintStyle: TextStyle(fontFamily: "Pacifico")
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchTrippage(
                                    searchtripviacountryorairplane:
                                        searchcountrynamecontroller),
                              ));
                        },
                        child:  Text(S.of(context).Search),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child:  Text(S.of(context).Close),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.search),
          );
      
  }
}
