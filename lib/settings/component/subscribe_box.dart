import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class SubscribeBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const SubscribeBox(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: AppColors.blue5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      child: Row(children: [
        SizedBox(
          width: 90,
          height: 90,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontSizes.getHeadline2Style()
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: FontSizes.getContentStyle().copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
