import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/signupmodel.dart';

class RegisterAnAccountServices {
  String baseUrl = "http://10.0.2.2:8000";

  Future<SignUpModel> registerAnAccountServices({
    required String firstName,
    required String lastName,
    required dynamic visaPhoto,
    required String nationalty,
    required String email,
    required dynamic phone,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/register"),
      );
      request.fields.addAll({
        "Firstname": firstName,
        "Lastname": lastName,
        "Nationalty": nationalty,
        "email": email,
        "phone": phone.toString(),
        "password": password,
        "password_confirmation": passwordConfirmation,
      });
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      request.files.add(await http.MultipartFile.fromPath(
        'visaphoto',
        visaPhoto.path,
      ));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseData = jsonDecode(await response.stream.bytesToString());
        print("فات عالرد");

        dynamic data = responseData['Data'];
        print(data);
        token = data["token"];
        print("خزن التوكن");
        Navigator.pushNamed(context, "HomePage");
        SignUpModel signUpModel = SignUpModel.fromJson(responseData);

        return signUpModel;
      } else if (response.statusCode == 422) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('There Is Error'),
          ),
        );
        throw Exception("there is error");
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred during registration: $e");
    }
  }
}
