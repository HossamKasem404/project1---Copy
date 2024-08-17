
class SearchTripViaCountryOrCompanyModel {
  final String message;
  final int status;
  final List<SearchTripDataModel> data;

  SearchTripViaCountryOrCompanyModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory SearchTripViaCountryOrCompanyModel.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> dataList = jsonData["data"];
    List<SearchTripDataModel> trips = dataList.map((item) => SearchTripDataModel.fromJson(item)).toList();
    return SearchTripViaCountryOrCompanyModel(
      message: jsonData["message"],
      status: jsonData["status"],
      data: trips
    );
  }
}

class SearchTripDataModel {
  final int id;
  final String tripplace;
  final String towards;
  final DateTime timetrip;
  final int price;
  final int amountofpeople;
  final int flightcompanyid;
  final int countryid;

  SearchTripDataModel({
    required this.id,
    required this.tripplace,
    required this.towards,
    required this.timetrip,
    required this.price,
    required this.amountofpeople,
    required this.flightcompanyid,
    required this.countryid,
  });

  factory SearchTripDataModel.fromJson(Map<String, dynamic> jsonData) {
    return SearchTripDataModel(
      id: jsonData["id"],
      tripplace: jsonData["TripPlace"],
      towards: jsonData["Towards"],
      timetrip: DateTime.parse(jsonData["TimeTrip"]),
      price: jsonData["Price"],
      amountofpeople: jsonData["amountpeople"],
      flightcompanyid: jsonData["fight_company_id"],
      countryid: jsonData["country_id"],
    );
  }
}
