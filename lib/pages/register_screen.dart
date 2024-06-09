import 'package:flutter/material.dart';
import 'package:footwear_client/pages/signin_screen.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:footwear_client/widgets/my_text_field.dart';
import 'package:footwear_client/widgets/otp_txt_field.dart';
import 'package:footwear_client/widgets/social_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';  // Import GetX package
import 'package:footwear_client/controller/login_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFF000000),
                Color(0xFF000000),
                Color(0xFF000000),
              ],
            ),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.03),
                Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.bold,
                    fontSize: 37,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Fill the details to get started!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 18,
                    color: textColor2,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                // for name and phone number
                myTextField("Enter your name", Colors.white, ctrl.registerNameCtrl),
                myTextField("Enter your phone number", Colors.black26, ctrl.registerNumberCtrl),
                const SizedBox(height: 10),
                SizedBox(height: size.height * 0.04),
                OtpTxtField(otpController: ctrl.otpController, visible: ctrl.otpFieldShown), 
                SizedBox(height: size.height * 0.04), 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      // for register button
                      GestureDetector(
                        onTap: () {
                          if(ctrl.otpFieldShown){
                            ctrl.addUser();
                          }else{
                            ctrl.sendOtp(); 
                          }
                        },
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Send Otp", 
                              style: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: 1.0 
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
                            "Already have an account? ",
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
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
