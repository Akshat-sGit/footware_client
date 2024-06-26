import 'package:flutter/material.dart';
import 'package:footwear_client/controller/home_controller.dart';
import 'package:footwear_client/model/user/user.dart'; // Ensure you import the User model
import 'package:footwear_client/pages/product_description_page.dart';
import 'package:footwear_client/pages/splash_screen.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:footwear_client/widgets/dropdown_btn.dart';
import 'package:footwear_client/widgets/multi_select_dropdown.dart';
import 'package:footwear_client/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final User loginUser;

  const HomePage({super.key, required this.loginUser});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // Initialize HomeController
      builder: (ctrl) {
        print('HomePage built with user: ${loginUser.name}'); // Debugging log

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Footwear Store',
              style: GoogleFonts.bebasNeue(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  GetStorage box = GetStorage();
                  box.erase();
                  Get.offAll(() => const MySplashScreen());
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
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: buttonColor,
                              width: 1,
                            ),
                          ),
                          backgroundColor: buttonColor,
                          label: Text(
                            'Category ${index + 1}',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: DropDown(
                        dropdownItem: 'Filter Brand',
                        items: const ['Nike', 'Puma', 'Adidas', 'Skechers'],
                        selectedItem: 'Sort',
                        onSelected: (value) {},
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: DropDown(
                        dropdownItem: 'Sort',
                        items: const ['Price: Low to High', 'Price: High to Low'],
                        selectedItem: 'Sort',
                        onSelected: (value) {},
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: MultiSelectDropDown(
                        items: const ['item1', 'item2', 'item3', 'item4'],
                        onSelectionChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(() {
                  if (ctrl.products.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: ctrl.products.length,
                      itemBuilder: (context, index) {
                        final product = ctrl.products[index];
                        return ProductCard(
                          name: product.name ?? "No Name",
                          imageUrl: product.image ?? "URL",
                          price: product.price ?? 0,
                          offerTag: 'Yes',
                          onTap: () {
                            Get.to(() => const ProductDescriptionPage());
                          },
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
