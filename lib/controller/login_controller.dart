import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/user/user.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  @override
  void onInit() {
    userCollection = firestore.collection('users'); 
    super.onInit(); 
  } 


  addUser() {
    try {
      DocumentReference doc = userCollection.doc();
      User user= User(
        id: doc.id,
        name: 'Abc',
        email: "abc@xyz.com"
      );
      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar('Success', 'User added successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

}
