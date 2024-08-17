import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:project1univ/main.dart";
import "package:project1univ/pages/login.dart";

Future logout(BuildContext context) async {
  http.Response response =
      await http.get(Uri.parse("$url/logoutClient"), headers: {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer $token"
  });
  if (response.statusCode == 200) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
      (route) => false,
    );
  } else {
    throw Exception(" there is an error");
  }
}
