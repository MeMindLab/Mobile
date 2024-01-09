import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;

  const CustomDatePicker({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: const Color(0xFFBBD7FF).withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 17, 0, 13),
            child: Text(
              "Pick a date",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF313131),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color(0xFFF1F3F8),
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              minimumDate: DateTime(2018),
              maximumDate: DateTime(2025),
              onDateTimeChanged: (DateTime newDate) {
                // Handle date change logic here if necessary.
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFF1F3F8),
                ),
              ),
            ),
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context, null); // Cancel
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Handle clear logic here if necessary.
                      },
                      child: const Center(
                        child: Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context, selectedDate); // Set
                    },
                    child: const Center(
                      child: Text(
                        'Set',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
