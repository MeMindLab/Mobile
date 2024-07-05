import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';

import 'package:me_mind/common/constant/font_sizes.dart';

class TagButton extends StatefulWidget {
  final bool isSelect;
  final String text;

  const TagButton({super.key, required this.isSelect, required this.text});

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            minimumSize: const Size(0, 0),
            backgroundColor:
                widget.isSelect ? AppColors.blueMain : AppColors.gray2),
        onPressed: () {},
        child: Text(
          widget.text,
          style:
              FontSizes.getCapsuleStyle().copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
