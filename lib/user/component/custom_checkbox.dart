import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return InkWell(
      onTap: _toggleCheckbox,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 24.0,
        child: Row(
          children: [
            widget.leading ??
                Container(
                  width: 24.0,
                  height: 24.0,
                  color: Colors.transparent,
                  child: Center(
                    child: SvgPicture.asset(
                      '$baseImageSvgPath/icon/check.svg',
                      colorFilter: _isChecked
                          ? ColorFilter.mode(
                              theme.appColors.blueButtonBackground,
                              BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            widget.trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );

    //return ListTile(
    //  dense: true, // 이 부분을 추가해보세요.
    //  contentPadding: EdgeInsets.zero,
    //  title: InkWell(
    //    onTap: _toggleCheckbox,
    //    child: Text(
    //      widget.title,
    //      style: const TextStyle(
    //        fontSize: 12,
    //      ),
    //    ),
    //  ),
    //  trailing: widget.trailing,
    //  leading: widget.leading ??
    //      InkWell(
    //        onTap: _toggleCheckbox,
    //        child: Container(
    //          width: 24.0,
    //          height: 24.0,
    //          color: Colors.transparent,
    //          child: Center(
    //            child: SvgPicture.asset(
    //              '$baseImageSvgPath/icon/check.svg',
    //              colorFilter: _isChecked
    //                  ? ColorFilter.mode(
    //                      theme.appColors.blueButtonBackground, BlendMode.srcIn)
    //                  : null,
    //            ),
    //          ),
    //        ),
    //      ),
    //);

    //return InkWell(
    //  onTap: _toggleCheckbox,
    //  child: Container(
    //    height: 24.0,
    //    padding: const EdgeInsets.symmetric(
    //      horizontal: 16.0,
    //    ),
    //    child: Row(
    //      children: [
    //        Container(
    //          width: 24.0,
    //          height: 24.0,
    //          color: Colors.transparent,
    //          child: Center(
    //            child: SvgPicture.asset(
    //              '$baseImageSvgPath/icon/check.svg',
    //              colorFilter: _isChecked
    //                  ? ColorFilter.mode(
    //                      theme.appColors.blueButtonBackground, BlendMode.srcIn)
    //                  : null,
    //            ),
    //          ),
    //        ),
    //        const SizedBox(width: 16.0), // 아이콘과 텍스트 사이의 간격
    //        Expanded(
    //          child: Text(
    //            widget.title,
    //            style: const TextStyle(
    //              fontSize: 12,
    //            ),
    //          ),
    //        ),
    //      ],
    //    ),
    //  ),
    //);
  }
}
