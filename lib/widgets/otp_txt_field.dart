import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OtpTxtField extends StatelessWidget {
  final OtpFieldControllerV2 otpController; 
  final bool visible; 
  final Function (String?) onComplete;
  const OtpTxtField({super.key, required this.otpController, required this.visible, required this.onComplete});  

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: OTPTextFieldV2(
        controller: otpController,
        length: 6,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.underline,
        outlineBorderRadius: 15,
        style: GoogleFonts.bebasNeue(fontSize: 17, color: Colors.white),
        onChanged: (pin) {
          // ignore: avoid_print
          print("Changed: $pin");
        },
        onCompleted: (pin) {
          onComplete(pin); 
        },
        otpFieldStyle: OtpFieldStyle(
          borderColor: Colors.white,
        ),

      ),
    );
  }
}