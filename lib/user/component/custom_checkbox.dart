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
  final EdgeInsetsGeometry? padding;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.title,
    this.leading,
    this.trailing,
    this.padding,
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

    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: InkWell(
        onTap: _toggleCheckbox,
        child: Container(
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }
}
