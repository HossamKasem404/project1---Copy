class SignUpModel {
  final String message;
  final DataMoldel data;
  SignUpModel({required this.message, required this.data});
  factory SignUpModel.fromJson(jsonData) {
    return SignUpModel(
        message: jsonData["message"],
        data: DataMoldel.fromJson(jsonData["Data"]));
  }
}

class DataMoldel {
  final UserModel user;
  final String token;
  DataMoldel({required this.user, required this.token});
  factory DataMoldel.fromJson(jsonData) {
    return DataMoldel(
        user: UserModel.fromjson(jsonData["user"]), token: jsonData["token"]);
  }
}

class UserModel {
  final String Firstname;
  final String Lastname;
  final String visaphoto;
  final String Nationalty;
  final String email;
  final String phone;
  final int id;
  UserModel(
      {required this.Firstname,
      required this.Lastname,
      required this.visaphoto,
      required this.Nationalty,
      required this.email,
      required this.phone,
      required this.id});
  factory UserModel.fromjson(jsonData) {
    return UserModel(
      id: jsonData["id"],
      Firstname: jsonData["Firstname"],
      Lastname: jsonData["Lastname"],
      visaphoto: jsonData["visaphoto"],
      phone: jsonData["phone"],
      Nationalty: jsonData["Nationalty"],
      email: jsonData["email"],
    );
  }

  
}
