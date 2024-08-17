import 'package:flutter/material.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/providers/get_unpaed_trips_provider.dart';
import 'package:provider/provider.dart';

class PayForTripsPage extends StatelessWidget {
  final int tripid;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  PayForTripsPage({super.key, required this.tripid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 173, 176),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                prefixIcon: const Icon(Icons.email, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                prefixIcon: const Icon(Icons.phone, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GetUnPayedTripProvider().payForTrip(
                  context,
                  tripid,
                  emailController.text,
                  phoneController.text,
                );
                  context.read<BalanceProvider>().fetchBalanceData();
                Navigator.push(context, MaterialPageRoute(builder: (conetxt)=> HomePage()));
                     

              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  "Pay",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
