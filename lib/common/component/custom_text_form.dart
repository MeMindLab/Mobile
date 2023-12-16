import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLength;
  final String? labelText;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;
  final Color? borderColor;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.maxLength,
    this.labelText,
    this.obscureText = false,
    this.autoFocus = false,
    required this.onChanged,
    this.suffixIcon,
    this.borderColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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

    Color inputBackground =
        CustomThemeHolder.of(context).theme.appColors.userInputBackground;

    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(
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
              style: FontSizes.getContentStyle().copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        SizedBox(
          height: 72,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            maxLength: widget.maxLength,
            obscureText: _obscureText,
            autofocus: widget.autoFocus,
            cursorColor: theme.focusColor,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              counterText: '',
              hintText: widget.hintText,
              errorText: widget.errorText,
              hintStyle: FontSizes.getContentStyle(),
              fillColor: inputBackground,
              filled: true, // false 배경색 없음 true 있음
              border: baseBorder,
              enabledBorder: baseBorder.copyWith(
                borderSide: baseBorder.borderSide.copyWith(
                  color: widget.borderColor,
                ),
              ),
              focusedBorder: baseBorder.copyWith(
                borderSide: baseBorder.borderSide.copyWith(
                  color: focusedBorderColor,
                ),
              ),

              suffixIcon: _obscureText
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
                  : widget.suffixIcon,
            ),
          ),
        )
      ],
    );
  }
}
