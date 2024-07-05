import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class CommunityPicture extends StatefulWidget {
  final bool isShare;
  const CommunityPicture({super.key, required this.isShare});

  @override
  State<CommunityPicture> createState() => _CommunityPictureState();
}

class _CommunityPictureState extends State<CommunityPicture> {
  bool isPictureShare = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isPictureShare = widget.isShare;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth * 0.30,
      child: Column(children: [
        communityPicture(
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif"),
        const SizedBox(
          height: 6,
        ),
        communityPictureTitle("하늘위에 있는 내 방"),
        const SizedBox(
          height: 5,
        ),
        commnuintyPictureContent(
            isHeartOn: isPictureShare, count: "65", date: "2024-01-25"),
      ]),
    );
  }

  Widget communityPicture(String pictureUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.network(
        pictureUrl,
        fit: BoxFit.cover,
        height: 135,
      ),
    );
  }

  Widget communityPictureTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: FontSizes.getHeadline2Style()
              .copyWith(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget commnuintyPictureContent(
      {required bool isHeartOn,
      VoidCallback? onTap,
      required String count,
      required String date}) {
    return Row(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              isPictureShare = !isPictureShare;
            });
          },
          child: SvgPicture.asset(
            isHeartOn
                ? 'assets/svg/icon/hearton.svg'
                : "assets/svg/icon/heartoff.svg",
            colorFilter: ColorFilter.mode(
                isHeartOn ? AppColors.blueMain : AppColors.gray7,
                BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          count,
          style:
              FontSizes.getContentStyle().copyWith(fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        Text(date,
            style: FontSizes.getContentStyle().copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.gray7,
            ))
      ],
    );
  }
}
