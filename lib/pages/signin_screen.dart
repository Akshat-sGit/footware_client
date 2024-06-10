import 'package:flutter/material.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:footwear_client/widgets/social_icon.dart';
import 'package:google_fonts/google_fonts.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            myTextField("Enter username", Colors.white),
            myTextField("Password", Colors.black26),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Recovery Password               ",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: textColor2,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // for sign in button
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 1,
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
                  Text.rich(
                    TextSpan(
                        text: "Not a member? ",
                        style: GoogleFonts.bebasNeue(
                          color: textColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        children:[
                          TextSpan(
                            text: "Register now",
                            style: GoogleFonts.bebasNeue(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }


  Container myTextField(String hint, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.bebasNeue(
              color: Colors.black45,
              fontSize: 19,
            ),
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: color,
            )),
      ),
    );
  }
}
