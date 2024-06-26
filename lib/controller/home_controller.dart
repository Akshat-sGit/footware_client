import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  var products = <Product>[].obs; // Using RxList for reactive state

  @override
  void onInit() {
    productCollection = firestore.collection('products');
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.assignAll(retrievedProducts);
      Get.snackbar('Successful', 'Products fetched successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }
  }
}
