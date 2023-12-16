import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/shadows/abs_theme_shadows.dart';

class LightAppShadows extends AbsThemeShadows {
  const LightAppShadows();

  @override
  BoxShadow get buttonShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );

  @override
  BoxShadow get thickTextShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );

  @override
  BoxShadow get defaultShadow => const BoxShadow(
        offset: Offset(5, 5),
        blurRadius: 10,
        color: Color.fromARGB(255, 69, 69, 69),
      );

  @override
  BoxShadow get textShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );
}
