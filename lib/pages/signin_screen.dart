import 'package:flutter/material.dart';
import 'package:footwear_client/controller/login_controller.dart';
import 'package:footwear_client/pages/register_screen.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:footwear_client/widgets/my_text_field.dart';
import 'package:footwear_client/widgets/social_icon.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
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
              "Wellcome back you've\nbeen missed!",
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                  fontSize: 27, color: textColor2, height: 1.2),
            ),
            SizedBox(height: size.height * 0.04),
            // for username and password
            myTextField(
              "Enter Phone Number", 
              Colors.white,
              ctrl.loginNumberCtrl, 
              ),
            // myTextField("Password", Colors.black26),
            const SizedBox(height: 10),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // for sign in button
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add product to database
                        ctrl.loginWithPhone();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.all(10),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 16,
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
                        child: Flexible(child: socialIcon("images/google.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(child: socialIcon("images/facebook.png")),
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
                                    builder: (context) => const Register()),
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
          ],
        )),
      ),
    );
  }); 
  }
}

