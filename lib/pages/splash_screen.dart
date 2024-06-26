import 'package:flutter/material.dart';
import 'package:footwear_client/pages/register_screen.dart';
import 'package:footwear_client/pages/signin_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black, 
                      spreadRadius: 1, 
                      blurRadius: 10, 
                      offset: Offset(0, -1),
                    ), 
                  ],
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                      "images/n4.png",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Discover your \n Dream Footware",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black,
                          height: 1.2, 
                          // letterSpacing: 2.0, 
                          ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Discover the trendiest shoe collections\n tailored to your style!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8),
                        letterSpacing: 0.4,
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffFD6B68).withOpacity(0.8),
                          border: Border.all(
                            color: const Color(0xffFD6B68),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFD6B68),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: InkWell(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Register(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Register",
                                        style: GoogleFonts.bebasNeue(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignIn(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
