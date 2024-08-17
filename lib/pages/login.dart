import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/signUpPage.dart';
import 'package:project1univ/service/loginservice.dart';

class LoginPage extends StatefulWidget {
   static String id = "Login";

  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 173, 176),
      body: Stack(
        children: [
         
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation!,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${S.of(context).Welcome_to} SafarWay",
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    _buildTextField(
                      hintText: S.of(context).Email,
                      obscureText: false,
                      icon: Icons.email,
                      controller: emailcontroller
                      
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      hintText:  S.of(context).Password,
                      obscureText: true,
                      icon: Icons.lock,
                      controller: passwordcontroller
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                         login(emailcontroller.text, passwordcontroller.text,
                            context);
                      
                      },
                      style: ElevatedButton.styleFrom(
                       
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child:  Text(
                        "${S.of(context).Login}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpPage()));

                      },
                      child: const Text(
                        "You Dont Have Account! ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({String? hintText, bool? obscureText, IconData ?icon, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: obscureText!,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black54,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}