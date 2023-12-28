import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

import 'package:me_mind/report/widget/capsule.dart';

class ReportCard extends StatelessWidget {
  final Image? image;
  final List<String> keywords;
  final String summary;
  final String date;

  const ReportCard({
    super.key,
    this.image,
    required this.keywords,
    required this.summary,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              width: 124,
              height: 124,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/image/onboarding/page1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: keywords
                        .map((keyword) => Capsule(keyword: keyword))
                        .toList(),
                  ),
                  Text(
                    summary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    date,
                    textAlign: TextAlign.right,
                    style: FontSizes.getCapsuleStyle().copyWith(
                      color: theme.appColors.datetimeColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
