class SearchCountryModel {
  final String message;
  final SearchCountryData? data;
  final String status ;
  SearchCountryModel({required this.message, this.data,required this.status});
  factory SearchCountryModel.fromjson(Map<String, dynamic> jsonData) {
    return SearchCountryModel(
      message: jsonData["message"] ?? "",
      data: jsonData["data"] != null
          ? SearchCountryData.fromjson(jsonData["data"])
          : null,
          status: jsonData["sattus"] ?? ""
    );
  }
}

class SearchCountryData {
  final int? id;
  final String name;
  final String photo;
  final String rate;
  SearchCountryData({this.id, required this.name, required this.photo, required this.rate});
  factory SearchCountryData.fromjson(Map<String, dynamic> jsonData) {
    return SearchCountryData(
      id: jsonData["id"] ?? 0,
      name: jsonData["name"] ?? "",
      photo: jsonData["photo"] ?? "",
      rate: jsonData["Rate"] ?? "",
    );
  }
}