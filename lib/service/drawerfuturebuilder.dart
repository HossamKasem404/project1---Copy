import 'package:flutter/material.dart';
import 'package:project1univ/models/profile_model.dart';
import 'package:project1univ/service/getuserprofileservice.dart';
import 'package:project1univ/widgets/drawer.dart';

class DrawerFutureBuilder extends StatelessWidget {
  const DrawerFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Map<ProfileModel, dynamic>>(
          future: GetUserProfileService().getUserProfile(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<ProfileModel, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else {
              Map<ProfileModel, dynamic> userinfo2 = snapshot.data!;

              return DrawerHomePage(userinfoindrawer: userinfo2);
            }
          },
        );
  }
}