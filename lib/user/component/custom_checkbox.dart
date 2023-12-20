import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final String label;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.label,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      leading: InkWell(
        onTap: () {
          setState(() {
            _isChecked = !_isChecked;
          });
          widget.onChanged(_isChecked);
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          color: Colors.transparent,
          child: Center(
            child: SvgPicture.asset(
              '$baseImageSvgPath/icon/check.svg',
              colorFilter: _isChecked
                  ? ColorFilter.mode(
                      theme.appColors.blueButtonBackground, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
