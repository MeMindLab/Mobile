import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomCheckBox extends StatelessWidget {
  final VoidCallback onChanged;
  final String svg;
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final bool isChecked;
  final bool? isBold;
  final bool? isAll;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.svg,
    this.leading,
    this.trailing,
    this.padding,
    required this.isChecked,
    this.isBold = false,
    this.isAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        height: 24.0,
        child: Row(
          children: [
            InkWell(
              onTap: onChanged,
              child: Container(
                width: 24.0,
                height: 24.0,
                color: Colors.transparent,
                child: Center(
                  child: SvgPicture.asset(
                    '$baseImageSvgPath/icon/$svg',
                    colorFilter: ColorFilter.mode(
                        isChecked
                            ? theme.appColors.checkColor
                            : AppColors.gray6,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: InkWell(
                onTap: onChanged,
                child: Text(
                  title,
                  style: FontSizes.getContentStyle().copyWith(
                      fontWeight:
                          isBold == false ? FontWeight.w400 : FontWeight.w500,
                      color: isChecked
                          ? theme.appColors.iconButton
                          : theme.appColors.hintText),
                ),
              ),
            ),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
