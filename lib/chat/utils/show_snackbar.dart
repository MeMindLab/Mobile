import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class ShowSnackBar {
  // final String text;
  // final BuildContext context;
  // ShowSnackBar({
  //   required this.text,
  //   required this.context,
  // });

  showSnackBarFunction(context, text, {bool? isBack = false}) {
    SnackBar snackBar = SnackBar(
      content: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/chat/snack_icon.svg',
            width: 22,
            height: 22,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(fontWeight: FontWeight.w500)),
        ],
      ),
      backgroundColor: lightTheme.primaryColor,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: isBack == false
              ? MediaQuery.of(context).size.height - 150
              : MediaQuery.of(context).size.height - 200,
          left: 10,
          right: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
