// ignore_for_file: avoid_print

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/user/user.dart';
import 'package:footwear_client/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  GetStorage box = GetStorage();

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  TextEditingController loginNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();

  bool otpFieldShown = false;
  int? otpSend;
  int? otpEntered;

  User? loginUser;

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = User.fromJson(user);
      if (loginUser != null) {
        Get.to(() => HomePage(loginUser: loginUser!));
      }
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  void addUser() {
    try {
      if (otpSend == otpEntered) {
        DocumentReference doc = userCollection.doc();
        User user = User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.parse(registerNumberCtrl.text),
        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
        registerNameCtrl.clear();
        registerNumberCtrl.clear();
        otpController.clear();
        otpFieldShown = false;
        update();
      } else {
        Get.snackbar('Error', 'OTP is incorrect', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  void sendOtp() {
    try {
      if (registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
        Get.snackbar('Error', 'Please fill the fields!', colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      otpFieldShown = true;
      otpSend = otp;
      Get.snackbar('Success', 'Otp sent successfully!, OTP is $otp', colorText: Colors.green);
      update();
    } catch (e) {
      Get.snackbar('Error', '$e', colorText: Colors.red);
    }
  }

  String get buttonName {
    return otpFieldShown ? 'Register' : 'Send OTP';
  }

  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = loginNumberCtrl.text.trim();
      if (phoneNumber.isNotEmpty) {
        int? phoneNumberParsed = int.tryParse(phoneNumber);
        if (phoneNumberParsed != null) {
          var querySnapshot = await userCollection.where('number', isEqualTo: phoneNumberParsed).limit(1).get();
          if (querySnapshot.docs.isNotEmpty) {
            var userDoc = querySnapshot.docs.first;
            var userData = userDoc.data() as Map<String, dynamic>?;
            box.write('loginUser', userData);
            loginNumberCtrl.clear();
            if (userData != null) {
              loginUser = User.fromJson(userData);
              print('User logged in: ${loginUser!.name}'); // Debugging log
              Get.to(() => HomePage(loginUser: loginUser!));
            } else {
              Get.snackbar('Error', 'User data is null', colorText: Colors.red);
            }
          } else {
            Get.snackbar('Error', 'User not found, please register', colorText: Colors.red);
          }
        } else {
          Get.snackbar('Error', 'Invalid phone number', colorText: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Please enter a phone number', colorText: Colors.red);
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to login: $error', colorText: Colors.red);
    }
  }
}
