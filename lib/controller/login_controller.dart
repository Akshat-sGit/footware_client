import 'package:cloud_firestore/cloud_firestore.dart';
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
}
