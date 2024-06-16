import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  List<Product> products = []; 

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();    
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Succesful', 'Products fetched successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }finally{
      update();
    }
  }

}