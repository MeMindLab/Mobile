import 'package:flutter/cupertino.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class CertifiedBox extends StatelessWidget {
  bool isCertified;

  CertifiedBox({super.key, this.isCertified = false});
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final containerWidth = isCertified ? 65.0 : 52.0;
    final content = isCertified ? '인증완료' : '미인증';

    return Container(
      width: containerWidth,
      height: 21,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isCertified
            ? lightTheme.primaryColor
            : theme.appColors.iconButtonInactivate,
      ),
      child: Center(
          child: Text(
        content,
        style: FontSizes.getCapsuleStyle()
            .copyWith(color: theme.appColors.iconButton, fontSize: 12),
      )),
    );
  }
}
