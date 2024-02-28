import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class SeetingCustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final String? initialText;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLength;
  final int? maxLines;
  final Color? bgColor;
  final String? labelText;
  final Widget? suffixWidget;
  final ValueChanged<String> onChanged;

  const SeetingCustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.initialText,
    this.obscureText = false,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines,
    this.bgColor,
    this.labelText,
    this.suffixWidget,
    required this.onChanged,
  });
  @override
  State<SeetingCustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<SeetingCustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color focusedBorderColor =
        CustomThemeHolder.of(context).theme.appColors.focusedBorder;

    Color hintTextColor =
        CustomThemeHolder.of(context).theme.appColors.hintText;
    // CustomThemeHolder.of(context).theme.appColors.hintText;

    Color inputBackground = widget.bgColor ?? Colors.white;

    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(13),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              widget.labelText!,
              style: FontSizes.getContentStyle().copyWith(color: hintTextColor),
            ),
          ),
        TextFormField(
          initialValue: widget.initialText,
          textInputAction: TextInputAction.next,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          obscureText: _obscureText,
          autofocus: widget.autoFocus,
          cursorColor: theme.focusColor,
          onChanged: widget.onChanged,
          style: TextStyle(color: hintTextColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            counterText: '',
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: const TextStyle(
              color: AppColors.gray9,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            fillColor: inputBackground,
            filled: true, // false 배경색 없음 true 있음
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13)),

            suffixIcon: widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: hintTextColor,
                    ),
                  )
                : widget.suffixWidget != null
                    ? widget.suffixWidget
                    : null, // 변경된 부분
          ),
        )
      ],
    );
  }
}
