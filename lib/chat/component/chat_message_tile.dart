import 'package:flutter/material.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/common/component/dots_indicator.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class ChatMessageTile extends StatelessWidget {
  final String message;
  final bool isAi;
  final bool isImage;
  final bool isSecond;
  final String createdAt;
  final bool? isAirequest;

  const ChatMessageTile(
      {super.key,
      required this.message,
      required this.isAi,
      required this.isImage,
      this.isSecond = false,
      required this.createdAt,
      this.isAirequest = false});

  factory ChatMessageTile.fromModel(
      ChatMessageModel chatModel, bool? isSecond) {
    return ChatMessageTile(
      isSecond: isSecond ?? false,
      message: chatModel.message,
      isAi: chatModel.isAi,
      isImage: chatModel.isImage,
      createdAt: chatModel.createdAt,
    );
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return isAi == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 23, left: 8, right: 12),
                child: isSecond
                    ? const SizedBox(
                        width: 50,
                        height: 50,
                      )
                    : Image.asset(
                        "assets/image/logo/chat_symbol.png",
                        width: 50,
                        height: 50,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: deviceWidth * 0.7,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                        color: AppColors.blue1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                            bottomRight: Radius.circular(32))),
                    child: isAirequest == true
                        ? const CustomDotsIndicator()
                        : Text(
                            message,
                            style: FontSizes.getCapsuleStyle()
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 16),
                    child: Text(
                      createdAt,
                      style: FontSizes.getCapsuleStyle().copyWith(
                          color: theme.appColors.hintText,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: deviceWidth * 0.7,
                    padding: EdgeInsets.symmetric(
                        horizontal: 24, vertical: isImage ? 0 : 16),
                    decoration: BoxDecoration(
                        color:
                            isImage ? null : theme.appColors.userChatBackground,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                            bottomLeft: Radius.circular(32))),
                    child: isImage
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Image.network(
                              message,
                              width: 269,
                              height: 269,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Text(message,
                            style: FontSizes.getCapsuleStyle()
                                .copyWith(fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 16.0),
                    child: Text(
                      createdAt,
                      style: FontSizes.getCapsuleStyle().copyWith(
                          color: theme.appColors.hintText,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          );
  }
}