import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class SeetingCustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final String? initialText;
  final bool obscureText;
  final bool autoFocus;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final Color? bgColor;
  final String? labelText;
  final Widget? suffixWidget;
  final ValueChanged<String> onChanged;
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? enabled;
  final TextEditingController? textEditingController;
  final bool? isError;
  final OutlineInputBorder? outlineInputBorder;

  const SeetingCustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.initialText,
    this.obscureText = false,
    this.autoFocus = false,
    this.maxLength,
    this.readOnly = false,
    this.maxLines,
    this.bgColor,
    this.labelText,
    this.suffixWidget,
    required this.onChanged,
    this.validator,
    this.onSaved,
    this.textInputFormatter,
    this.enabled = true,
    this.textEditingController,
    this.isError = false,
    this.outlineInputBorder,
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

    Color labelTextColor =
        CustomThemeHolder.of(context).theme.appColors.iconButton;
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
              style: FontSizes.getHeadline1Style()
                  .copyWith(color: labelTextColor, fontWeight: FontWeight.w500),
            ),
          ),
        TextFormField(
          controller: widget.textEditingController,
          initialValue: widget.initialText,
          textInputAction: TextInputAction.next,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          cursorHeight: 18,
          autofocus: widget.autoFocus,
          enabled: widget.enabled,
          cursorColor: theme.focusColor,
          readOnly: widget.readOnly,
          validator: widget.validator,
          inputFormatters: widget.textInputFormatter,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          style: FontSizes.getContentStyle()
              .copyWith(color: labelTextColor, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 15, 15, 15),
            prefix: const Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            counterText: '',
            hintText: widget.hintText,
            errorText: widget.errorText,
            errorStyle: FontSizes.getCapsuleStyle().copyWith(
                color: AppColors.timerColor, fontWeight: FontWeight.w500),
            hintStyle: FontSizes.getContentStyle()
                .copyWith(color: AppColors.gray5, fontWeight: FontWeight.w400),
            fillColor: inputBackground,
            filled: true, // false 배경색 없음 true 있음
            enabledBorder: widget.outlineInputBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13)),
            focusedBorder: widget.outlineInputBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13)),

            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.timerColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.timerColor)),

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
                    : null,
          ),
        )
      ],
    );
  }
}
