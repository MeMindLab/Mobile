import 'package:flutter/material.dart';
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
  final ValueChanged<String> onChanged;

  const SeetingCustomTextFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.initialText,
    this.obscureText = false,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines,
    this.bgColor,
    this.labelText,
    required this.onChanged,
  }) : super(key: key);

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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
            //border: baseBorder,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13)),
            // enabledBorder: baseBorder,
            // focusedBorder: baseBorder.copyWith(
            //   borderSide: baseBorder.borderSide.copyWith(
            //     color: focusedBorderColor,
            //   ),
            // ),
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
                : null, // 변경된 부분
          ),
        )
      ],
    );
  }
}
