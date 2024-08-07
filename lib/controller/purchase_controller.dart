// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/controller/login_controller.dart';
import 'package:footwear_client/model/user/user.dart';
import 'package:footwear_client/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PurchaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;

  TextEditingController addressController = TextEditingController();

  double orderPrice = 0;
  String itemName = '';
  String orderAddress = '';
  int selectedSize = 0; // Add a variable to store the selected shoe size

  @override
  void onInit() {
    orderCollection = firestore.collection('orders');
    super.onInit();
  }

  void updateSelectedSize(int size) {
    selectedSize = size;
    update();
  }

  void resetSelectedSize() {
    selectedSize = 0;
    update();
  }

  void submitOrder({
    required double price,
    required String item,
    required String description,
  }) {
    orderPrice = price;
    itemName = item;
    orderAddress = addressController.text;

    if (selectedSize == 0) {
      Get.snackbar('Error', 'Please select a shoe size.', colorText: Colors.red);
      return;
    }

    Razorpay _razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_QPidmdfhhPid4U',
      'amount': price * 100,
      'name': item,
      // 'description': description,
    };

    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      // Do something when payment succeeds
      Get.snackbar('Success', 'Payment is Successful', colorText: Colors.green);
      orderSuccess(transactionId: response.paymentId);
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      // Do something when payment fails
      Get.snackbar('Error', '${response.message}', colorText: Colors.red);
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.open(options);
  }

  void showOrderSuccessDialog(String orderId) {
    User? loginUse = Get.find<LoginController>().loginUser;
    Get.defaultDialog(
      title: 'Order Success',
      content: Text('Your order ID is $orderId'),
      confirm: ElevatedButton(
        onPressed: () {
          resetSelectedSize(); // Reset the selected size when closing the dialog
          Get.off(() => HomePage(loginUser: loginUse));
        },
        child: const Text('Close'),
      ),
    );
  }

  Future<void> orderSuccess({required String? transactionId}) async {
    User? loginUse = Get.find<LoginController>().loginUser;

    try {
      if (transactionId != null) {
        DocumentReference docRef = await orderCollection.add({
          'customer': loginUse?.name ?? '',
          'phone': loginUse?.number ?? '',
          'item': itemName,
          'price': orderPrice,
          'address': orderAddress,
          'size': selectedSize, // Include the selected shoe size in the order
          'transactionId': transactionId,
          'dateTime': DateTime.now().toString(),
        });
        print('Order created successfully: ${docRef.id}');
        showOrderSuccessDialog(docRef.id);
        Get.snackbar('Success', 'Order Created Successfully', colorText: Colors.green);
        resetSelectedSize(); // Reset the selected size after a successful order
      } else {
        Get.snackbar('Error', 'Please fill all fields', colorText: Colors.red);
      }
    } catch (error) {
      print("Failed to register order: $error}");
      Get.snackbar('Error', 'Error generating order', colorText: Colors.red);
    }
  }

  @override
  void onClose() {
    addressController.dispose();
    super.onClose();
  }
}