import 'package:flutter/material.dart';
import 'package:footwear_client/widgets/dropdown_btn.dart';
import 'package:footwear_client/widgets/multi_select_dropdown.dart';
import 'package:footwear_client/widgets/product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Footwear Store',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
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
                    backgroundColor: Colors.white.withOpacity(0.9),
                    label: Text(
                      'Category ${index + 1}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
                return const ProductCard(); 
              },
            ),
          )
        ],
      ),
    );
  }
}



// Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(20),
//                     ));