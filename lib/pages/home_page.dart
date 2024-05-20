import 'package:flutter/material.dart';
import 'package:footwear_client/widgets/dropdown_btn.dart';
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
                        backgroundColor: Colors.black,
                        label: Text('Category $index',
                            style: GoogleFonts.poppins(color: Colors.white))),
                  );
                }),
          ),
          Row(
            children: [
              Flexible(
                child: DropDown(
                    dropdownItem: 'Filter Brand',
                    items: const ['Nike', 'Puma', 'Adidas', 'Skechers'],
                    selectedItem: 'Sort',
                    onSelected: (value) {}),
              ),
              Flexible(
                child: DropDown(
                    dropdownItem: 'Sort',
                    items: const ['Price: Low to High', 'Price: High to Low'],
                    selectedItem: 'Sort',
                    onSelected: (value) {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
