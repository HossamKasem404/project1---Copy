class HotelModel {
  final int id;
  final String name;
  final String location;
  final String description;
  final String Basicphoto;
  final String Roomphoto1;
  final String Roomphoto2;
  final String Roomphoto3;
  final String food;
  final String service;
  final String comforts;
  final String safe;
  final String Rate;
  final String contreyname;
  final String contreyphoto;
  final String contreyRate;

  HotelModel(
      {required this.id,
      required this.Basicphoto,
      required this.Rate,
      required this.Roomphoto1,
      required this.Roomphoto2,
      required this.Roomphoto3,
      required this.comforts,
      required this.contreyRate,
      required this.contreyname,
      required this.contreyphoto,
      required this.description,
      required this.food,
      required this.location,
      required this.name,
      required this.safe,
      required this.service});
  factory HotelModel.fromJson(jsonData) {
    return HotelModel(
        id: jsonData["id"],
        Basicphoto: jsonData["Basicphoto"],
        Rate: jsonData["Rate"],
        Roomphoto1: jsonData["Roomphoto1"],
        Roomphoto2: jsonData["Roomphoto2"],
        Roomphoto3: jsonData["Roomphoto3"],
        comforts: jsonData["comforts"],
        contreyRate: jsonData["contreyRate"],
        contreyname: jsonData["contreyname"],
        contreyphoto: jsonData["contreyphoto"],
        description: jsonData["description"],
        food: jsonData["food"],
        location: jsonData["location"],
        name: jsonData["name"],
        safe: jsonData["safe"],
        service: jsonData["service"]);
  }
}
