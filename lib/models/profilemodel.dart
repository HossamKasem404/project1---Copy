class   ProfileModel {
 final String message;
 final DataMoldel data ;
 final int status ;
 ProfileModel({
  required this.message ,
  required this.data ,
  required this.status
 });
 factory ProfileModel.fromJson(jsonData){
  return ProfileModel(message: jsonData["message"], data: DataMoldel.fromjson(jsonData["data"]),status: jsonData["status"]);
 }
}

class DataMoldel {
 final int id;
 final String Firstname;
 final String Lastname;
 final String visaphoto;
 final String phone;
final  String Nationalty;
 final String email;
 final String role;
  DataMoldel({
    required this.id,
    required this.Firstname,
    required this.Lastname,
    required this.visaphoto,
    required this.phone,
    required this.Nationalty,
    required this.email,
    required this.role,
  });
  factory DataMoldel.fromjson(jsonData) {
    return DataMoldel(
        id: jsonData["id"],
        Firstname: jsonData["Firstname"],
        Lastname: jsonData["Lastname"],
        visaphoto: jsonData["visaphoto"],
        phone: jsonData["phone"],
        Nationalty: jsonData["Nationalty"],
        email: jsonData["email"],
        role: jsonData["role"]);
  }
}
