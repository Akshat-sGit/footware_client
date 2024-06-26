// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:footwear_client/controller/login_controller.dart';
import 'package:footwear_client/pages/register_screen.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:footwear_client/widgets/my_text_field.dart';
import 'package:footwear_client/widgets/social_icon.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: [
                SizedBox(height: size.height * 0.03),
                Text(
                  "Hello Again!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.bold,
                    fontSize: 37,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Welcome back you've\nbeen missed!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 27,
                    color: textColor2,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                myTextField(
                  "Enter Phone Number",
                  Colors.white,
                  ctrl.loginNumberCtrl,
                ),
                const SizedBox(height: 10),
                SizedBox(height: size.height * 0.04),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Sign In button pressed'); // Debugging log
                      ctrl.loginWithPhone();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: size.width * 0.2,
                      color: Colors.black12,
                    ),
                    Text(
                      "  Or continue with   ",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        color: textColor2,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: size.width * 0.2,
                      color: Colors.black12,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: socialIcon("images/google.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: socialIcon("images/facebook.png"),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: GoogleFonts.bebasNeue(
                        color: textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: GoogleFonts.bebasNeue(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
