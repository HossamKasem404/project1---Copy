import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/providers/gettripsprovider.dart';
import 'package:project1univ/service/update_reserve_trip_service.dart';
import 'package:provider/provider.dart';

class UpdateInfoReserveTrip extends StatefulWidget {
  UpdateInfoReserveTrip({super.key, required this.tripID});
  final int? tripID;

  @override
  State<UpdateInfoReserveTrip> createState() => _UpdateInfoReserveTripState();
}

class _UpdateInfoReserveTripState extends State<UpdateInfoReserveTrip> {
  @override
  void initState() {
    super.initState();
    context.read<GetTripProvider>().fetchReservedTrips();
    context.read<BalanceProvider>().fetchBalanceData();
  }

  final TextEditingController fathernamecontroller = TextEditingController();
  final TextEditingController mothernamecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final TextEditingController flightclasscontroller = TextEditingController();
  final TextEditingController wightcontroller = TextEditingController();
  final TextEditingController amountofpeoplecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.tripID.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 173, 176), 
        title: const Text("Reserve Your Trips"),
      ),
      body: Column(
        children: [
          TextField(
            controller: fathernamecontroller,
            decoration: InputDecoration(labelText: 'Father Name'),
          ),
          TextField(
            controller: mothernamecontroller,
            decoration: InputDecoration(labelText: 'Mother Name'),
          ),
          TextField(
            controller: gendercontroller,
            decoration: InputDecoration(labelText: 'Gender'),
          ),
          TextField(
            controller: flightclasscontroller,
            decoration: InputDecoration(labelText: 'Flight Class'),
          ),
          TextField(
            controller: wightcontroller,
            decoration: InputDecoration(labelText: 'Weight'),
          ),
          TextField(
            controller: amountofpeoplecontroller,
            decoration: InputDecoration(labelText: 'Amount of People'),
          ),
          ElevatedButton(
            onPressed: () async {
              await UpdateInfoReserveTripService().updateinforeservetripservice(
                widget.tripID!.toString(),
                fathernamecontroller.text,
                mothernamecontroller.text,
                gendercontroller.text,
                flightclasscontroller.text,
                wightcontroller.text,
                amountofpeoplecontroller.text,
                context,
              );
              // Refresh data after update
              context.read<GetTripProvider>().fetchReservedTrips();
              context.read<BalanceProvider>().fetchBalanceData();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
