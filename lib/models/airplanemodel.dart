class AirplaneModel {
  final List<Airplanedata> data;
  final String message;
  final int sattus;

  AirplaneModel({
    required this.data,
    required this.message,
    required this.sattus,
  });

  factory AirplaneModel.fromJson(jsonData) {
    List<dynamic> dataList = jsonData["data"];
    List<Airplanedata> airplaneCompany = dataList
        .map(
          (item) => Airplanedata.fromJson(item),
        )
        .toList();
    return AirplaneModel(
      data: airplaneCompany,
      message: jsonData["message"],
      sattus: jsonData["sattus"],
    );
  }
}

class Airplanedata {
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

  Airplanedata({
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

  factory Airplanedata.fromJson(jsonData) {
    return Airplanedata(
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
