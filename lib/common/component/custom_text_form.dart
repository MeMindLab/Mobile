import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLength;
  final String? labelText;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;
  final Color? borderColor;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final FocusNode? focusNode;
  final VoidCallback? onToggleObscureText;
  final bool isToggle;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.maxLength,
    this.labelText,
    this.obscureText = false,
    this.autoFocus = false,
    this.suffixIcon,
    this.borderColor,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    required this.onChanged,
    this.readOnly = false,
    this.onToggleObscureText,
    this.isToggle = false,
  });

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
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(13),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              labelText!,
              style: FontSizes.getHighLightContentStyle(),
            ),
          ),
        TextFormField(
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: TextInputAction.next,
          maxLength: maxLength,
          obscureText: obscureText,
          autofocus: autoFocus,
          cursorColor: theme.focusColor,
          cursorWidth: 1.5,
          cursorHeight: 13,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            counterText: '',
            hintText: hintText,
            errorText: errorText,
            errorStyle: const TextStyle(height: 0),
            hintStyle: FontSizes.getContentStyle(),
            fillColor: inputBackground,
            filled: true, // false 배경색 없음 true 있음
            border: baseBorder,
            enabledBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(
                color: borderColor,
              ),
            ),
            focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(
                color: focusedBorderColor,
              ),
            ),

            suffixIcon: isToggle
                ? GestureDetector(
                    onTap: () {
                      if (onToggleObscureText != null) {
                        onToggleObscureText!();
                      }
                    },
                    child: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: hintTextColor,
                    ),
                  )
                : suffixIcon,
          ),
        )
      ],
    );
  }
}
