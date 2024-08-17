import 'package:flutter/material.dart';





class GetAllSearchedTripsDetailes extends StatelessWidget {

  GetAllSearchedTripsDetailes({super.key,required this.tripdetails,});
 var tripdetails ;
 
  // final String tripPlace = "Abbaseen";
  // final String towards = "Syria";
  // final String timeTrip = "2024-05-29 10:30:00";
  // final double price = 2000;
  // final int amountPeople = 249;
  // final String companyName = "ShamWings";
  // final String countryName = "Syria";

  @override
  Widget build(BuildContext context) {
     
        
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 173, 176),
        title: const Text('Trip Details'),
      ),
      body: 
      
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          
          children: <Widget>[
            const Text(
              'Trip Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Departure Place: ${tripdetails.tripplace}'),
            Text('Destination: ${tripdetails.towards}'),
            Text('Departure Time: ${tripdetails.timetrip}'),
            Text('Price per Ticket: \$${tripdetails.price}'),
            Text('Seats Available: ${tripdetails.amountofpeople}'),
            const SizedBox(height: 20),
            const Text(
              'Company Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
           // Text('Airline: ${trip.companyName}'),
          //  Text('Country of Operation: ${trip.countryName}'),
            const SizedBox(height: 20),
            const Text(
              'Trip Highlights',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Abbaseen',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Abbaseen, a bustling hub, serves as the starting point for your journey. Known for its vibrant markets and rich cultural heritage, Abbaseen is a place where the past and present coexist harmoniously.'),
            const SizedBox(height: 10),
            const Text(
              'Syria',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Your destination, Syria, offers a tapestry of history, culture, and breathtaking landscapes. From the ancient ruins of Palmyra to the bustling streets of Damascus, Syria is a land of unparalleled beauty and historical significance.'),
            const SizedBox(height: 20),
            const Text(
              'Booking Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Book Your Trip: Secure your seat now to experience the journey of a lifetime.'),
            const Text('Flexible Payment Options: Pay in installments or in full.'),
            const Text('Customer Support: Available 24/7 to assist with any inquiries or issues.'),
            const SizedBox(height: 20),
            const Text(
              'Travel Guidelines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Check-In: Please arrive at least 2 hours before departure for check-in and security procedures.'),
            const Text('Baggage Allowance: Each passenger is allowed one carry-on bag and one checked bag.'),
            const Text('Travel Documents: Ensure you have all necessary travel documents, including your passport and visa, if required.'),
            const SizedBox(height: 20),
            const Text(
              'Safety Measures',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('ShamWings is committed to ensuring a safe and comfortable journey for all passengers. We adhere to the highest safety standards and protocols to protect your health and well-being during your trip.'),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Email: marwan@gmail.com'),
            const Text('Phone: +123-456-7890'),
            const Text('Address: ShamWings Office, Damascus, Syria'),
            const SizedBox(height: 20),
            const Text(
              'Reviews and Testimonials',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('"An unforgettable experience! The service was excellent, and the journey was smooth. Highly recommend ShamWings." - A satisfied traveler.'),
            const Text('"From start to finish, everything was perfect. The staff was friendly, and the flight was comfortable." - Another happy customer.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (
                
              ) {
                // Add booking functionality here
              },
              child: const Text(' '),
            ),
          ],
        ),
      ),
    );
  }
}
