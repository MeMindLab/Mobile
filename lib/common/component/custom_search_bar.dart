import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback? onSubmitted;

  CustomSearchBar({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    FocusNode focuseNode = FocusNode();

    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(13),
    );

    Color hintTextColor =
        CustomThemeHolder.of(context).theme.appColors.datetimeColor;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: hintTextColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focuseNode,
              style: const TextStyle(
                fontSize: 14,
              ),
              cursorColor: Theme.of(context).focusColor,
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: onSubmitted,
                  icon: SvgPicture.asset(
                    'assets/svg/icon/search.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      hintTextColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                hintText: "내용을 입력해주세요",
                hintStyle:
                    FontSizes.getTextStyle().copyWith(color: hintTextColor),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                enabledBorder: baseBorder,
              ),
              onSubmitted: (value) => onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
