import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String url = '';

class ProductCard extends StatelessWidget {
  final String name;
  final String iamgeUrl;
  final double price;
  final String offerTag;
  final Function onTap; 

  const ProductCard(
      {super.key,
      required this.name,
      required this.iamgeUrl,
      required this.price,
      required this.offerTag,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap(),
      child: Card(
        shadowColor: Colors.black,
        color: const Color(0xffffffff),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Text(
                'Name',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Text(
                'Price',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
