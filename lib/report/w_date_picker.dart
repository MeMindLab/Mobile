import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class ReportDatePicker extends StatelessWidget {
  const ReportDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "2023.02",
            style: FontSizes.getHeadline1Style()
                .copyWith(fontWeight: FontWeight.w500),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/svg/icon/search.svg', // SVG 파일의 경로
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onPressed: () {
              // 아이콘이 클릭될 때 실행되는 로직을 여기에 작성하세요.
            },
          ),
        ],
      ),
    );
  }
}
