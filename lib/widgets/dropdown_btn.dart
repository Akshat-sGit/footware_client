// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDown extends StatefulWidget {
  final String dropdownItem;
  final List<String> items;
  final String? selectedItem; // Allow selectedItem to be nullable
  final void Function(String) onSelected;

  const DropDown({
    super.key,
    required this.dropdownItem,
    required this.items,
    required this.onSelected,
    this.selectedItem, // Make selectedItem optional
  });

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    // Set _selectedItem to selectedItem if provided and valid, otherwise to the first item of the list
    if (widget.selectedItem != null && widget.items.contains(widget.selectedItem)) {
      _selectedItem = widget.selectedItem!;
    } else {
      _selectedItem = widget.items.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shadowColor: Colors.white,
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
                return Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.dropdownItem,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black,
                          iconEnabledColor: Colors.white,
                          value: _selectedItem,
                          items: widget.items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                              widget.onSelected(newValue);
                              Navigator.pop(context);
                            }
                          },
                          isExpanded: true,
                          iconSize: 24,
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
              widget.dropdownItem,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}