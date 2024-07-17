import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container myTextField(String hint, Color color, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.bebasNeue(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          fillColor: Colors.black,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.bebasNeue(
            color: Colors.white54,
            fontSize: 19,
          ),
        ),
      ),
    );
  }