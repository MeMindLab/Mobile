import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLength;
  final String? labelText;

  final ValueChanged<String> onChanged;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.maxLength,
    this.labelText,
    this.obscureText = false,
    this.autoFocus = false,
    required this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color focusedBorderColor =
        CustomThemeHolder.of(context).theme.appColors.focusedBorder;

    Color hintTextColor =
        CustomThemeHolder.of(context).theme.appColors.hintText;

    Color inputBackground =
        CustomThemeHolder.of(context).theme.appColors.userInputBackground;

    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(13),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) // 추가된 부분
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        TextFormField(
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          autofocus: widget.autoFocus,
          cursorColor: theme.focusColor,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            counterText: '',
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: TextStyle(
              color: hintTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            fillColor: inputBackground,
            filled: true, // false 배경색 없음 true 있음
            border: baseBorder,
            enabledBorder: baseBorder,
            focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(
                color: focusedBorderColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
