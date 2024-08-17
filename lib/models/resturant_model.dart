class ResturantModel {
  int id;
  String resturantName;
  int resturantPhone;
  String resturantPhoto;
  String location;
  String description ;
  String food;
  String service;
  String comforts;
  String safe;
  String rate;
  String openingHours;
  String closingHours;
  String countryName;

  ResturantModel({
    required this.id,
    required this.resturantName,
    required this.resturantPhone,
    required this.resturantPhoto,
    required this.food,
    required this.service,
    required this.comforts,
    required this.safe,
    required this.rate,
    required this.openingHours,
    required this.closingHours,
    required this.countryName,
    required this.location,
    required this.description
  });

  // Optionally, you can add methods like fromJson and toJson for easier serialization
  factory ResturantModel.fromJson(Map<String, dynamic> json) {
    return ResturantModel(
      id: json['id'],
      resturantName: json['RestaurantName'],
      location: json['location'],
      resturantPhone: json['PhoneOFRestaurant'],
      description: json['description'],
      resturantPhoto: json['photo'],
      food: json['food'],
      service: json['service'],
      comforts: json['comforts'],
      safe: json['safe'],
      rate: json['Rate'],
      openingHours: json['opening_hours'],
      closingHours: json['closing_hours'],
      countryName: json['contreyname'],
    );
  }}