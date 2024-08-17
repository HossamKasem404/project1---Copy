
class SearchAirplaneModel {
  final String message;
  final searchAirplanedata data;
  SearchAirplaneModel({
    required this.message,
    required this.data,
  });
  factory SearchAirplaneModel.fromjson(jsonData) {
    return SearchAirplaneModel(
      message: jsonData["message"],
      data: searchAirplanedata.fromJson(jsonData["data"]),
    );
  }
}

class searchAirplanedata {
  final int id;
  final String name;
  final String location;
  final String description;
  final String photo;
  final String Rate;
  final String food;
  final String service;
  final String Comforts;
  final String safe;
  final int Country_id;

  searchAirplanedata({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.photo,
    required this.Rate,
    required this.food,
    required this.service,
    required this.Comforts,
    required this.safe,
    required this.Country_id,
  });

  factory searchAirplanedata.fromJson(jsonData) {
    return searchAirplanedata(
      id: jsonData["id"],
      name: jsonData["name"],
      location: jsonData["location"],
      description: jsonData["description"],
      photo: jsonData["photo"],
      Rate: jsonData["Rate"],
      food: jsonData["food"],
      service: jsonData["service"],
      Comforts: jsonData["Comforts"],
      safe: jsonData["safe"],
      Country_id: jsonData["Country_id"],
    );
  }
}
