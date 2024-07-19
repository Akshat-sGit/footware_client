import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:footwear_client/controller/purchase_controller.dart';
import 'package:footwear_client/utils/colors.dart';
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
    final List<int> sizes = [4, 5, 6, 7, 8, 9, 10, 11, 12];

    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "Product Details",
            style: GoogleFonts.bebasNeue(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              ctrl.resetSelectedSize(); // Reset the selected size when going back
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        name,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Ensures the backdrop filter respects the border radius
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur effect
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [Colors.black.withOpacity(1), Colors.black.withOpacity(0.3)],
                                  stops: const [0.0, 5.0],
                                  tileMode: TileMode.repeated,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.overlay,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4), // Adjust opacity for transparency and grainy effect
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Description",
                                        style: GoogleFonts.bebasNeue(
                                          color: buttonColor,
                                          fontSize: 18,
                                        ), // Ensuring the text is visible
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        description,
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ), // Ensuring the text is visible
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        "Select Size",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50, // Adjust height as needed
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: sizes.map((size) {
                            bool isSelected = size == ctrl.selectedSize;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ChoiceChip(
                                label: Text(
                                  size.toString(),
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  ctrl.updateSelectedSize(size);
                                },
                                selectedColor: Colors.green,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Enter Address",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10,), 
                      TextField(
                        controller: ctrl.addressController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: "Enter your billing address",
                          labelStyle: GoogleFonts.bebasNeue(
                            color: Colors.white54,
                          ),
                        ),
                        style: GoogleFonts.bebasNeue(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                height: 2,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price:",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "₹${price.toStringAsFixed(2)}",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  onPressed: () {
                    ctrl.submitOrder(price: price, item: name, description: description);
                  },
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.bebasNeue(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}