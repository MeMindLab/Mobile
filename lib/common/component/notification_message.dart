import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class NotificationMessage extends StatelessWidget {
  final VoidCallback closeCallback;

  const NotificationMessage({super.key, required this.closeCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.blueMain, width: 1)),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Text(
                  "미마인드가 그려준 그림일기를 공유할 수 있는 커뮤니티입니다. 다른 사람의 그림을 자유롭게 구경하고 저장할 수 있어요!",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: closeCallback,
                child: Text(
                  "닫기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
