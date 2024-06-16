import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold),
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
                'https://firebasestorage.googleapis.com/v0/b/ecommerce-66787.appspot.com/o/nike1.jpg?alt=media&token=9f74d9fc-cbcb-4781-b990-c3e637c3be4c',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Puma Footware",
              style:
                  GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Text(
              "Product Description",
              style: GoogleFonts.bebasNeue(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "₹3000",
              style: GoogleFonts.ebGaramond(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 20.0),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                labelText: "Enter your billing address",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 5,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 1))),
                onPressed: () {},
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
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
  }
}
