import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/profile_model.dart';
import "package:http/http.dart" as http;

class GetUserProfileService {
  Future<Map<ProfileModel, dynamic>> getUserProfile() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/ProfileClient"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
print(response.body);
      if (response.statusCode == 200) {
        print("فات عرد معلومات المستخدم");
        Map<String, dynamic> responseData = jsonDecode(response.body);
        ProfileModel profileModel = ProfileModel.fromJson(responseData);
        Map<ProfileModel, dynamic> result = {profileModel: responseData};
        
        print(result);
        return result;
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      return {};
    }
  }
}
