import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/models/profile_model.dart';
import 'package:project1univ/pages/all_trips_page.dart';
import 'package:project1univ/pages/unpayed_trips_page.dart';
import 'package:project1univ/providers/language_provider.dart';
import 'package:project1univ/providers/themeprovider.dart';
import 'package:project1univ/service/logoutservice.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart'; // Import url_launcher

class DrawerHomePage extends StatefulWidget {
  const DrawerHomePage({super.key, required this.userinfoindrawer});
  final Map<ProfileModel, dynamic> userinfoindrawer;

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  ProfileModel? profileModel;
  String currentLanguage = 'en';

  void _switchLanguage() {
    setState(() {
      currentLanguage = currentLanguage == 'en' ? 'ar' : 'en';
    });
  }

  @override
  void initState() {
    super.initState();
    profileModel = widget.userinfoindrawer.keys.first;
  }

  void updateProfileData(ProfileModel updatedProfile) {
    setState(() {
      profileModel = updatedProfile;
    });
  }

  // Function to launch email client
  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'HamedMoulla@64@gmail.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open email client')),
      );
    }
  }

  // Function to launch phone dialer
  Future<void> _launchPhoneDialer() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '0982519194',
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open phone dialer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = widget.userinfoindrawer.keys.first;

    return Drawer(
     
      child: Column(
        
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 11, 173, 176),
            ),
            accountName: Text('${profileModel.data.Firstname} ${profileModel.data.Lastname}'),
            accountEmail: Text(profileModel.data.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profileModel.data.visaphoto),
            ),
          ),
          Expanded(
            child: ListView(
              
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.logout),
                  title:  Text(S.of(context).Logout),
                  onTap: () {
                    logout(context);
                  },
                ),
               
                ListTile(
                  leading: const Icon(Icons.update),
                  title:  Text(S.of(context).Update_Profile ),
                  onTap: () {
                    Navigator.pushNamed(context, "UpdateProfile");
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.tent),
                  title:  Text(S.of(context).My_Trips),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllTrips(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.paypal),
                  title:  Text(S.of(context).My_UnPaid_Trips),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UnpayedTripsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title:  Text(S.of(context).Dark_Mode),
                  trailing: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, _) {
                      return Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title:  Text(S.of(context).Change_Language),
                  trailing: Consumer<LanguageProvider>(
                    builder: (context, languageProvider, _) {
                      return Switch(
                        value: languageProvider.isEnglish,
                        onChanged: (value) {
                          languageProvider.changeLanguage();
                        },
                      );
                    },
                  ),
                  leading: Consumer<LanguageProvider>(
                    builder: (context, languageProvider, _) {
                      return languageProvider.isEnglish
                          ? CountryFlag.fromCountryCode(
                              'US',
                              shape: const Circle(),
                            )
                          : CountryFlag.fromCountryCode(
                              'AE',
                              shape: const Circle(),
                            ); // Symbol of the Arabic language
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, height: 1),
          Padding(
          
            padding: const EdgeInsets.all(16.0),
            child: Column(
              

              children: [
                Text("Contact Us"),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.black54),
                  title: const Text('HamedMoulla@64@gmail.com'),
                  onTap: _launchEmail,
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.black54),
                  title: const Text('0982519194'),
                  onTap: _launchPhoneDialer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
