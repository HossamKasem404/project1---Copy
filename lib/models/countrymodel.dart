class CountryModel {
  final String message;
  final List<CountryData> data;
  final int status;

  CountryModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory CountryModel.fromJson(jsonData) {
    List<dynamic> dataList = jsonData["data"];
    List<CountryData> countries = dataList
       .map((item) => CountryData.fromJson(item) ,).toList();
    return CountryModel(
      message: jsonData["message"],
      data: countries,
      status: jsonData["status"],
    );
  }
}

class CountryData {
  final int id;
  final String name;
  final String photo;
  final String rate;

  CountryData({
    required this.id,
    required this.name,
    required this.photo,
    required this.rate,
  });

  factory CountryData.fromJson(jsonData) {
    return CountryData(
      id: jsonData["id"],
      name: jsonData["name"],
      photo: jsonData["photo"],
      rate: jsonData["Rate"],
    );
  }
}