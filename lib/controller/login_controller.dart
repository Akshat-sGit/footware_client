// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/user/user.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController(); 
  TextEditingController registerNumberCtrl = TextEditingController(); 

  OtpFieldControllerV2 otpController = OtpFieldControllerV2(); 

  bool otpFieldShown = false;
  int? otpSend ;
  int? otpEntered; 

  @override
  void onInit() {
    userCollection = firestore.collection('users'); 
    super.onInit(); 
  } 


  addUser() {
    try {
      if(otpSend == otpEntered){
        DocumentReference doc = userCollection.doc();
        User user= User(
          id: doc.id,
          name: registerNameCtrl.text, 
          number: int.parse(registerNumberCtrl.text), 
        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar('Success', 'User added successfully',colorText: Colors.green); 
        registerNameCtrl.clear(); 
        registerNumberCtrl.clear(); 
        otpController.clear(); 
      }else{
        Get.snackbar('Error', 'OTP is incorrect',colorText: Colors.red ); 
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  sendOtp() {

    try{
    if(registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
      Get.snackbar('Error', 'Please fill the fields!', colorText: Colors.red); 
      return; 
    }
    final random = Random();
    int otp = 1000 + random.nextInt(9000);  
    print(otp); 
    if(otp!= null){
      otpFieldShown = true; 
      otpSend = otp; 
      Get.snackbar('Success', 'Otp sent successfully!', colorText: Colors.green); 
    }else{
      Get.snackbar('Error', 'Otp not sent!', colorText: Colors.red);
    }
    }catch (e) {
      print(e); 
    }finally{
      update(); 
    }
  }
  

}
