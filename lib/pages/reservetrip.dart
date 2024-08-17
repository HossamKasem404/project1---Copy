import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/pages/pay_for_trips_page.dart';
import 'package:project1univ/service/reservetripeservice.dart';
import 'package:project1univ/service/reservretripandpay.dart';
import 'package:project1univ/widgets/textFormFieldWidget.dart';

// ignore: must_be_immutable
class ReserveTrip extends StatelessWidget {
  ReserveTrip({super.key, this.tripID});
  int ? tripID;
  static String id = "ReserveTrip";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fathernamecontroller = TextEditingController();
  TextEditingController mothernamecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController flightclasscontroller = TextEditingController();
  TextEditingController wightcontroller = TextEditingController();
  TextEditingController amountofpeoplecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 11, 173, 176),
        title:  Text(S.of(context).Reserve_Your_Trips),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: emailcontroller,
            hintText: S.of(context).Enter_Your_email,
            icon: const Icon(Icons.mail),
            obscureText: false,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormFieldWidget(
            controller: fathernamecontroller,
            hintText: S.of(context).Enter_Your_Father_Name,
            icon: const Icon(Icons.man),
            obscureText: false,
            type: TextInputType.name,
          ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: mothernamecontroller,
            hintText: S.of(context).Enter_Your_Mother_Name,
            icon: const Icon(Icons.woman),
            obscureText: false,
            type: TextInputType.name,
          ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: gendercontroller,
            hintText: S.of(context).Enter_your_gender,
            icon: const Icon((FontAwesomeIcons.genderless)),
            obscureText: false,
            type: TextInputType.name,
          ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: flightclasscontroller,
            hintText:S.of(context).Enter_Your_Favourite_flight_class,
            icon: const Icon(Icons.airplane_ticket),
            obscureText: false,
            type: TextInputType.name,
          ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: wightcontroller,
            hintText: S.of(context).Enter_Your_weight,
            icon: const Icon(Icons.line_weight),
            obscureText: false,
            type: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            controller: amountofpeoplecontroller,
            hintText: S.of(context).Enter_Amount_of_People,
            icon: const Icon(Icons.numbers),
            obscureText: false,
            type: TextInputType.number,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 100,
            height: 80,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black45,
                  elevation: 54,
                  shadowColor: Colors.black),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(S.of(context).Do_You_want_to_Pay_Now),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ReserveTripAndPay().reservetripservice(
                                    tripID!,
                                    emailcontroller.text,
                                    fathernamecontroller.text,
                                    mothernamecontroller.text,
                                    gendercontroller.text,
                                    flightclasscontroller.text,
                                    int.parse(wightcontroller.text),
                                    int.parse(amountofpeoplecontroller.text),
                                    context,
                                  );
                                 

                                },
                                child:  Text(
                                  S.of(context).Yes,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                   ReserveTripService().reservetripservice(
                                    tripID!,
                                    emailcontroller.text,
                                    fathernamecontroller.text,
                                    mothernamecontroller.text,
                                    gendercontroller.text,
                                    flightclasscontroller.text,
                                    int.parse(wightcontroller.text),
                                    int.parse(amountofpeoplecontroller.text),
                                    context,
                                  );
                                },
                                child:  Text(
                                  
                                  S.of(context).No,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:  Text(
                            S.of(context).Close,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child:  Text(
                S.of(context).Reserve,
                style: TextStyle(color: Colors.black),
              ),
            ),
            // child: ElevatedButton(
            //     style: ButtonStyle(elevation: WidgetStatePropertyAll(20)),
            //     onPressed: () {
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             content: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text("Do you want to pay now 😜 ?"),
            //                 Row(
            //                   children: [
            //                     ElevatedButton(
            //                         onPressed: () {
            //                           ReserveTripService().reservetripservice(
            //                               tripID!,
            //                               emailcontroller.text,
            //                               fathernamecontroller.text,
            //                               mothernamecontroller.text,
            //                               gendercontroller.text,
            //                               flightclasscontroller.text,
            //                               int.parse(wightcontroller.text),
            //                               int.parse(
            //                                   amountofpeoplecontroller.text),
            //                               context);
            //                         },
            //                         child: Text(
            //                           "yes",
            //                           style: TextStyle(color: Colors.black),
            //                         )),
            //                     ElevatedButton(
            //                         onPressed: () {
            //                           Navigator.pushNamed(context, HomePage.id);
            //                         },
            //                         child: Text(
            //                           "No",
            //                           style: TextStyle(color: Colors.black),
            //                         ))
            //                   ],
            //                 )
            //               ],
            //             ),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: Text(
            //                   "Close",
            //                   style: TextStyle(color: Colors.black),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       );
            //     },
            //     child: Text(
            //       "Reserve",
            //       style: TextStyle(color: Colors.black),
            //     )),
          )
        ],
      ),
    );
  }
}
