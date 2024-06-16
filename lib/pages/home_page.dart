import 'package:flutter/material.dart';
import 'package:footwear_client/pages/product_description_page.dart';
import 'package:footwear_client/pages/signin_screen.dart';
import 'package:footwear_client/widgets/dropdown_btn.dart';
import 'package:footwear_client/widgets/multi_select_dropdown.dart';
import 'package:footwear_client/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Footwear Store',
          style: GoogleFonts.belleza(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GetStorage box = GetStorage(); 
              box.erase(); 
              Get.offAll(const SignIn());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    label: Text(
                      'Category ${index + 1}',
                      style: GoogleFonts.ubuntu(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropDown(
                  dropdownItem: 'Filter Brand',
                  items: const ['Nike', 'Puma', 'Adidas', 'Skechers'],
                  selectedItem: 'Sort',
                  onSelected: (value) {},
                ),
              ),
              Flexible(
                child: DropDown(
                  dropdownItem: 'Sort',
                  items: const ['Price: Low to High', 'Price: High to Low'],
                  selectedItem: 'Sort',
                  onSelected: (value) {},
                ),
              ),
              Flexible(
                child: MultiSelectDropDown(
                  items: const ['item1', 'item2', 'item3', 'item4'],
                  onSelectionChanged: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return ProductCard(
                  name: 'Adidas',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/ecommerce-66787.appspot.com/o/adidas1.jpg?alt=media&token=b3e251a6-7560-4c27-bddd-d61a4e526b81',
                  price: 2000.0,
                  offerTag: 'Yes',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductDescriptionPage()),
                    );
                  },
                );
              },
              itemCount: 10, // Make sure to provide itemCount
            ),
          )
        ],
      ),
    );
  }
}
