import 'package:flutter/material.dart';
import 'package:footwear_client/controller/purchase_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescriptionPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double price;

  const ProductDescriptionPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(builder: (ctrl){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Product Details",
          style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: GoogleFonts.bebasNeue(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              "₹${price.toStringAsFixed(2)}",
              style: GoogleFonts.bebasNeue(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: ctrl.addressController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                labelText: "Enter your billing address",
                labelStyle: GoogleFonts.bebasNeue()
              ),
              style:const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onPressed: () {
                  ctrl.submitOrder(price: price , item: name, description: description); 
                },
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    }); 
  }
}
