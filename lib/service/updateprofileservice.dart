
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';

class UpdateProfileService {
  Future updatprofileservice(  String ?firstName,
     String ? lastName,
    // dynamic ?visaPhoto,
     String ?nationalty,
     String ?email,
     dynamic phone,
     String ?password,
     BuildContext context
    )async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("http://10.0.2.2:8000/api/updateclientprofile"),
      );
      request.fields.addAll({
        "Firstname": firstName??"",
        "Lastname": lastName??"",
        "Nationalty": nationalty??"",
        "email": email??"",
        "phone": phone.toString(),
        "password": password??"",
     
      });
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      // request.files.add(await http.MultipartFile.fromPath(
      //   'visaphoto',
      //   visaPhoto.path,
      // ));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(token);
 if (response.statusCode == 200){
  print("فات و عدل المعلومات") ;
  showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("seccefull Updated"),
              content: const Text("Updated done."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
 }
     
}catch(e){
  print(e);
}}}