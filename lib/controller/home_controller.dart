// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/model/product/product.dart';
import 'package:footwear_client/model/product_category/product_category.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  var products = <Product>[].obs;
  var productCategory = <ProductCategory>[].obs;
  var productShowInUI = <Product>[].obs;
  var brands = <String>[].obs; // New observable list for brands

  @override
  void onInit() {
    productCollection = firestore.collection('products');
    categoryCollection = firestore.collection('category');
    fetchCategory();
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
      productShowInUI.assignAll(retrievedProducts);

      // Extract distinct brands
      Set<String> distinctBrands = retrievedProducts.map((product) => product.brand).where((brand) => brand != null).cast<String>().toSet();
      brands.assignAll(distinctBrands.toList());

      Get.snackbar('Successful', 'Products fetched successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }
  }

  Future<void> fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategories = categorySnapshot.docs
          .map((doc) => ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productCategory.assignAll(retrievedCategories);
      Get.snackbar('Successful', 'Category fetched successfully',
          colorText: Colors.green);
      print(productCategory.length);
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
    }
  }

  void filterByCategory(String category) {
    var filteredProducts = products.where((product) => product.category == category).toList();
    productShowInUI.assignAll(filteredProducts);
    update();
    print('product length is : ${productShowInUI.length}');
  }

  void filterByBrand(List<String> brands) {
    if (brands.isEmpty) {
      productShowInUI.assignAll(products);
    } else {
      List<String> lowerCaseBrands = brands.map((brand) => brand.toLowerCase()).toList();
      var filteredProducts = products.where((product) => lowerCaseBrands.contains(product.brand?.toLowerCase())).toList();
      productShowInUI.assignAll(filteredProducts);
    }
    update();
    print('Filtered products count: ${productShowInUI.length}');
  }

  void sortByPrice({required bool ascending}) {
    List<Product> sortedProducts = List<Product>.from(productShowInUI);
    sortedProducts.sort((a, b) => ascending ? a.price!.compareTo(b.price!) : b.price!.compareTo(a.price!));
    productShowInUI.assignAll(sortedProducts); 
    update();
  }
  void resetFilters() {
    productShowInUI.assignAll(products); // Reset the productShowInUI to show all products
    update();
  }

}