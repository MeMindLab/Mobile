import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class DiaryPicture extends StatelessWidget {
  final String pictureUrl;

  const DiaryPicture({super.key, required this.pictureUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            pictureUrl,
            fit: BoxFit.cover,
            width: 124,
            height: 124,
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Row(
            children: [
              Text(
                "123",
                style:
                    FontSizes.getContentStyle().copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 2,
              ),
              SvgPicture.asset(
                'assets/svg/icon/hearton.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.blueMain, BlendMode.srcIn),
                width: 20,
                height: 20,
              )
            ],
          ),
        )
      ]),
    );
  }
}