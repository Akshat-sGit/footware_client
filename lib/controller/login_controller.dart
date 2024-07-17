import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:footwear_client/model/user/user.dart' as custom_user;
import 'package:footwear_client/pages/home_page.dart'; // Ensure HomePage is imported

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  GetStorage box = GetStorage();

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  TextEditingController loginNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();

  bool otpFieldShown = false;
  String verificationId = "";
  custom_user.User? loginUser;

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = custom_user.User.fromJson(user);
      if (loginUser != null) {
        Get.to(() => HomePage(loginUser: loginUser!)); // Ensure HomePage is defined and imported
      }
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  void addUser() async {
    try {
      DocumentReference doc = userCollection.doc();
      custom_user.User user = custom_user.User(
        id: doc.id,
        name: registerNameCtrl.text,
        number: int.parse(registerNumberCtrl.text),
      );
      final userJson = user.toJson();
      await doc.set(userJson);
      Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
      registerNameCtrl.clear();
      registerNumberCtrl.clear();
      otpController.clear();
      otpFieldShown = false;
      update();
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

      FirebaseAuth auth = FirebaseAuth.instance;
      auth.verifyPhoneNumber(
        phoneNumber: '+91${registerNumberCtrl.text}', // Adjust country code as needed
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          addUser();
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.message ?? 'Verification failed', colorText: Colors.red);
          print(e.message); 
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          otpFieldShown = true;
          Get.snackbar('Success', 'OTP sent successfully', colorText: Colors.green);
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e.toString()); 
    }
  }

  void verifyOtp(String otp) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      addUser();
    } catch (e) {
      Get.snackbar('Error', 'OTP verification failed', colorText: Colors.red);
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
              loginUser = custom_user.User.fromJson(userData);
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