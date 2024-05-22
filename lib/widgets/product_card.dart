import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String url = '';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/ecommerce-66787.appspot.com/o/adidas1.jpg?alt=media&token=b3e251a6-7560-4c27-bddd-d61a4e526b81',
              fit: BoxFit.fitWidth,
              width: double.maxFinite,
              height: 150,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Name',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            'Price',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
