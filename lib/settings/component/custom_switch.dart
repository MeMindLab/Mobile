import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color? enableColor;
  final Color? disableColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool> onChanged;

  CustomSwitch(
      {super.key,
      required this.value,
      this.enableColor,
      this.disableColor,
      this.width,
      this.height,
      this.switchHeight,
      this.switchWidth,
      required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 59.0,
            height: widget.height ?? 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: widget.value
                  ? theme.appColors.grayButtonBackground
                  : theme.appColors.text,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 110),
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Transform.scale(
                  scale: 1.7,
                  child: Container(
                    width: widget.switchWidth ?? 20.0,
                    height: widget.switchHeight ?? 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.value
                            ? Colors.white
                            : theme.appColors.iconBook,
                        border: Border.all(
                            width: 1,
                            color: theme.appColors.grayButtonBackground)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
