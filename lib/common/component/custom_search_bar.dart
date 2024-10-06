import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomSearchBar extends StatefulWidget {
  final VoidCallback? onSubmitted;
  final TextEditingController? controller;

  const CustomSearchBar({super.key, this.onSubmitted, this.controller});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController searchController = TextEditingController();
    FocusNode focuseNode = FocusNode();

    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.invisibleColor,
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
              onEditingComplete: widget.onSubmitted,
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: widget.onSubmitted,
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
              onSubmitted: (value) => widget.onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
