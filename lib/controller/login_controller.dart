import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
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
      // Product product = Product(
      //   id: doc.id,
      //   name: nameController.text,
      //   category: category,
      //   description: descriptionController.text,
      //   price: double.parse(priceController.text),
      //   brand: brand,
      //   image: imageController.text,
      //   offer: offer,
      // );
      final produtJson = product.toJson();
      doc.set(produtJson);
      Get.snackbar('Success', 'Product added successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

}
