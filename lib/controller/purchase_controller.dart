// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_client/controller/login_controller.dart';
import 'package:footwear_client/model/user/user.dart';
import 'package:footwear_client/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PurchaseController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance; 
  late CollectionReference orderCollection; 

  TextEditingController addressController = TextEditingController();

  double orderPrice = 0;    
  String itemName = ''; 
  String orderAddress = ''; 


  @override
  void onInit() {
    orderCollection = firestore.collection('orders'); 
    super.onInit(); 
  }

  void submitOrder({required double price,required String item, required String description}){
    orderPrice = price; 
    itemName = item; 
    orderAddress = addressController.text; 

    Razorpay _razorpay = Razorpay(); 
    var options = {
      'key': 'rzp_test_QPidmdfhhPid4U',
      'amount': price * 100,
      'name': item,
      // 'description': description,
      };

    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      // Do something when payment succeeds
      Get.snackbar('Success', "Payment is Successfull", colorText: Colors.green);  
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      // Do something when payment fails
      Get.snackbar('Error', '${response.message}', colorText: Colors.red); 
    }
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.open(options);

    void showOrderSuccessDialog(String orderId){
      User? loginUse = Get.find<LoginController>().loginUser;
      Get.defaultDialog(
        title: "Order Success", 
        content: Text('Your order ID is $orderId'), 
        confirm: ElevatedButton(
          onPressed: (){
            Get.off(() => HomePage(loginUser: loginUse));
          },
          child: const Text('Close')
        )
      ); 
    }
  
    Future<void> orderSuccess({required String? transactionId}) async {

      User? loginUse = Get.find<LoginController>().loginUser; 

      try{
        if(transactionId != null){
          DocumentReference docRef = await orderCollection.add({
            'customer' : loginUse?.name ?? '', 
            'phone' : loginUse?.number ?? '', 
            'item' : itemName, 
            'price' : orderPrice, 
            'address' : orderAddress, 
            'transactionId' : transactionId, 
            'dateTime': DateTime.now().toString(), 
          });
          print('Order created successfully: ${docRef.id}'); 
          showOrderSuccessDialog(docRef.id); 
          Get.snackbar('Success', 'Order Created Successfully', colorText: Colors.green); 
        }else{
          Get.snackbar('Error', 'Please fill all fields', colorText: Colors.red);  
        }
      }catch(error){
        print("Failed to register order: $error}"); 
        Get.snackbar('Error', 'Error generating order', colorText: Colors.red);
      }
    }

    
  }
}