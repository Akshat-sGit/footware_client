import 'package:flutter/material.dart';
import 'package:footwear_client/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> selectedItems = [];

class MultiSelectDropDown extends StatelessWidget {
  final String name;
  final List<String> items;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectDropDown({
    super.key,
    required this.items,
    required this.onSelectionChanged,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.white,
            backgroundColor: Colors.black,
            elevation: 5,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.white,
                width: 4,
              ),
            ),
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.black,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: buttonColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          LimitedBox(
                            maxHeight: 200, // Adjust height to ensure 4 items are visible
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = items[index];
                                final isSelected = selectedItems.contains(item);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected
                                          ? selectedItems.remove(item)
                                          : selectedItems.add(item);
                                      onSelectionChanged(selectedItems);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          isSelected
                                              ? Icons.check_box_outlined
                                              : Icons.check_box_outline_blank,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            item,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}