import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';

class LemonNumberWidget extends ConsumerStatefulWidget {
  const LemonNumberWidget({
    super.key,
  });

  @override
  ConsumerState<LemonNumberWidget> createState() => _LemonNumberWidgetState();
}

class _LemonNumberWidgetState extends ConsumerState<LemonNumberWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lemonStateNotifierProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/icon/lemon.svg',
          width: 28,
          height: 28,
        ),
        const SizedBox(width: 3.0),
        Text(
          "$state",
          style: FontSizes.getHeadline1Style().copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
