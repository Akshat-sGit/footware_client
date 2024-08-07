// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:footwear_client/controller/home_controller.dart';
import 'package:footwear_client/model/user/user.dart'; 
import 'package:footwear_client/pages/product_description_page.dart';
import 'package:footwear_client/pages/splash_screen.dart';
import 'package:footwear_client/widgets/dropdown_btn.dart';
import 'package:footwear_client/widgets/multi_select_dropdown.dart';
import 'package:footwear_client/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final User? loginUser;

  const HomePage({super.key, required this.loginUser});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (ctrl) {
        print('HomePage built with user: ${loginUser?.name}'); 

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Footwear Store',
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  GetStorage box = GetStorage();
                  box.erase();
                  Get.offAll(() => const MySplashScreen());
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
            leading: IconButton(onPressed:() {
              ctrl.resetFilters();
            },
             icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              )
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.productCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          ctrl.filterByCategory(ctrl.productCategory[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Chip(
                              elevation: 5,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side:const BorderSide(
                                  color:Colors.white ,
                                  width: 2,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              label: Text(
                                ctrl.productCategory[index].name ?? "Error",
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Obx(() {
                        return MultiSelectDropDown(
                          name: "Brand", 
                          items: ctrl.brands.toList(), // Use dynamic list of brands
                          onSelectionChanged: (value) {
                            ctrl.filterByBrand(value);
                          },
                        );
                      }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: DropDown(
                        dropdownItem: 'Sort',
                        items: const ['Price: Low to High', 'Price: High to Low'],
                        selectedItem: 'Sort',
                        onSelected: (value) {
                          ctrl.sortByPrice(ascending: value == 'Price: Low to High' ? true : false); 
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(() {
                  if (ctrl.productShowInUI.isEmpty) {
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
                      itemCount: ctrl.productShowInUI.length,
                      itemBuilder: (context, index) {
                        final product = ctrl.productShowInUI[index];
                        return ProductCard(
                          name: product.name ?? "No Name",
                          imageUrl: product.image ?? "URL",
                          price: product.price ?? 0,
                          offerTag: 'Yes',
                          onTap: () {
                            Get.to(() => ProductDescriptionPage(
                              imageUrl: product.image ?? "URL",
                              name: product.name ?? "No Name",
                              description: product.description ?? "No Description", // Pass description
                              price: product.price ?? 0,
                            ));
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