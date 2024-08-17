
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/pages/login.dart';
import 'package:project1univ/pages/signUpPage.dart';
import 'package:project1univ/pages/updateprofile.dart';
import 'package:project1univ/pages/welcom_page.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/providers/get_unpaed_trips_provider.dart';
import 'package:project1univ/providers/gettripsprovider.dart';
import 'package:project1univ/providers/language_provider.dart';
import 'package:project1univ/providers/themeprovider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());
 String token = "" ;
  String url = "http://10.0.2.2:8000/api" ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => BalanceProvider()),
        ChangeNotifierProvider(create: (context) => GetUnPayedTripProvider()),
        ChangeNotifierProvider(create: (context) => GetTripProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, _) {
          return MaterialApp(
            locale: languageProvider.isEnglish ? const Locale('en') : const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            routes: {
              LoginPage.id: (context) => const LoginPage(),
              WelcomPage.id : (context) => WelcomPage(),
              HomePage.id: (context) => const HomePage(),
              SignUpPage.id: (context) => const SignUpPage(),
              UpdateProfile.id: (context) => const UpdateProfile(),
            },
            initialRoute: WelcomPage.id ,
            title: 'Dark Mode Example',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          );
        },
      ),
    );
  }
}
