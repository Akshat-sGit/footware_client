import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDown extends StatelessWidget {
  final String dropdownItem;
  final List<String> items;
  final String selectedItem;
  final void Function(String) onSelected;

  const DropDown({
    super.key,
    required this.dropdownItem,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.tealAccent,
            elevation: 5,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                  color: Colors.black, width: 1), // Add a border
            ),
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor:
                  Colors.white, // Set modal bottom sheet background to white
              builder: (BuildContext context) {
                return Container(
                  color:
                      Colors.white, // Ensure the container background is white
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dropdownItem,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Ensure text is visible
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            200, // Adjust height to ensure 4 items are visible
                        child: CupertinoPicker(
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          itemExtent: 40,
                          onSelectedItemChanged: (int index) {
                            onSelected(items[index]);
                          },
                          backgroundColor:
                              Colors.white, // Set picker background to white
                          children: items.map((String item) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black, // Ensure text is visible
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              dropdownItem,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.poppins(
                color: Colors.black, // Ensure text is visible
                fontSize: 14, // Increase font size for better readability
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
