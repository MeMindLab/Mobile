import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

import 'package:me_mind/report/w_capsule.dart';

class ReportCard extends StatelessWidget {
  final String? imageUrl;
  final List<String> keywords;
  final String summary;
  final String date;
  final Color? color;

  const ReportCard({
    super.key,
    this.imageUrl,
    required this.keywords,
    required this.summary,
    required this.date,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    String newDate = DateFormat("yyyy.MM.dd").format(DateTime.parse(date));

    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.gray5,
            ),
            width: 124,
            height: 124,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl == null
                  ? Image.asset(
                      'assets/image/onboarding/page1.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/image/onboarding/page1.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: keywords
                        .map((keyword) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Capsule(
                                keyword: keyword,
                                color: color,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    summary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      newDate,
                      textAlign: TextAlign.right,
                      style: FontSizes.getCapsuleStyle().copyWith(
                        color: theme.appColors.datetimeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
