
class Tripinfo {
  final int id ;
  final String fathername;
  final String mothername;
  final String gender;
  final String flightclass;
  final int wight;
  final int amountofpeopleforcostumer;
  final String status;
  final TripData trip;
  Tripinfo(
      {required this.id,required this.fathername,
      required this.mothername,
      required this.gender,
      required this.flightclass,
      required this.wight,
      required this.amountofpeopleforcostumer,
      required this.status,
      required this.trip});
  factory Tripinfo.fromJson(jsonData) {
    return Tripinfo(
      id:  jsonData["id"],
        fathername: jsonData["fatherName"],
        mothername: jsonData["MotherName"],
        gender: jsonData["Gendor"],
        flightclass: jsonData["FlightClass"],
        wight: jsonData["Wight"],
        amountofpeopleforcostumer: jsonData["amountpeople"],
        status: jsonData["status"],
        trip: TripData.fromJson(jsonData["trip"]));
  }
}

class TripData {
  final String tripplace;
  final String twords;
  final String timetrip;
  final int price;
  final int amountofpeopleinttrip;
  

  TripData(
      {required this.tripplace,
      required this.timetrip,
      required this.twords,
      required this.price,
      required this.amountofpeopleinttrip,
    
      
      });
  factory TripData.fromJson(jsonData) {
    return TripData(
        tripplace: jsonData["TripPlace"],
        timetrip: jsonData["TimeTrip"],
        twords: jsonData["Towards"],
        price: jsonData["Price"],
        amountofpeopleinttrip: jsonData["amountpeople"],
     
        );
  }
}
