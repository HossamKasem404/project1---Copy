class TripModel {
  final String message;
  final List<TripData> data;
  final int status;

  TripModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory TripModel.fromJson(jsonData) {
    List<dynamic> dataList = jsonData["data"];
    List<TripData> countries = dataList
       .map((item) => TripData.fromJson(item) ,).toList();
    return TripModel(
      message: jsonData["message"],
      data: countries,
      status: jsonData["status"],
    );
  }
}

class TripData {
  final int id;
  final String tripPlace;
  final String towards;
  final String timeTrip ;
  final int price ;
  final int amountpeople;
  final String companyName;
  final String countryName;

  TripData({
    required this.id,
    required this.tripPlace,
    required this.towards,
    required this.companyName,
    required this.timeTrip,
    required this.price,
    required this.amountpeople,
    required this.countryName
  });

  factory TripData.fromJson(jsonData) {
    return TripData(
      id: jsonData["id"],
      tripPlace: jsonData["tripPlace"],
      towards: jsonData["towards"],
      companyName: jsonData["companyName"],
      timeTrip :jsonData["timeTrip"],
      price : jsonData["price"],
      amountpeople : jsonData["amountpeople"],
      countryName : jsonData["countryName"]
    );
  }
}