import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OtpTxtField extends StatelessWidget {
  final OtpFieldControllerV2 otpController; 
  const OtpTxtField({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return OTPTextFieldV2(
      controller: otpController,
      length: 5,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 45,
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 15,
      style:const TextStyle(fontSize: 17),
      onChanged: (pin) {
        // ignore: avoid_print
        print("Changed: $pin");
      },
      onCompleted: (pin) {
        // ignore: avoid_print
        print("Completed: $pin");
      },
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white, 
      ),
    );
  }
}