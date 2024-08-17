import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/service/updateprofileservice.dart';
import '../Widgets/buttonWidget.dart';
import '../Widgets/textFormFieldWidget.dart';

class UpdateProfile extends StatefulWidget {
  static String id = "UpdateProfile";

  const UpdateProfile({super.key});
  @override
  State<UpdateProfile> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<UpdateProfile> {


  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  bool passToggle = true;
  bool passToggle1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 173, 176),
      body: Form(
        key: _formField,
        child: ListView(
          children: [
            Stack(
              children: [
                //this for image
                Container(
                  // width: double.maxFinite,
                  height: 1200,
                 
                ),
                 Positioned(
                  top: 50,
                  left: 30,
                  child: Text(
                    S.of(context).Update_Profile,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //this for first name
                Positioned(
                  top: 100,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _firstNameController,
                    hintText:S.of(context).Enter_First_Name,
                    icon: const Icon(Icons.person),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _lastNameController,
                    hintText:S.of(context).Enter_Last_Name,
                    icon: const Icon(Icons.person),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _nationalityController,
                    hintText:S.of(context).Enter_Nationality,
                    icon: const Icon(Icons.location_history),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    type: TextInputType.number,
                    controller: _phoneNumberController,
                    hintText: S.of(context).Enter_Phone_Number,
                    icon: const Icon(Icons.phone),
                  ),
                ),
                
                Positioned(
                  top: 550,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: false,
                    controller: _emailController,
                    hintText: S.of(context).Enter_Email,
                    icon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Positioned(
                  top: 650,
                  left: 30,
                  child: TextFormFieldWidget(
                    obscureText: passToggle,
                    controller: _passWordController,
                    hintText: S.of(context).Enter_Password,
                    icon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),

                Positioned(
                  top: 740,
                  left: 150,
                  child: ButtonWidget(
                    onTap: () async {
                      if (_formField.currentState!.validate()) {
                        try {
                          UpdateProfileService().updatprofileservice(
                              _firstNameController.text,
                              _lastNameController.text,
                            //  imageVisa,
                              _nationalityController.text,
                              _emailController.text,
                              _phoneNumberController.text,
                              _passWordController.text,
                              context  
                              );

                          Navigator.pushNamed(context, HomePage.id);
                        } catch (ex) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('There Is Error'),
                            ),
                          );
                        }
                      }
                    },
                    height: 50,
                    width: 100,
                    color: Colors.black,
                    text: S.of(context).Update,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
