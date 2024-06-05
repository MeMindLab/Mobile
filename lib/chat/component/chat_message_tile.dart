import 'package:flutter/material.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class ChatMessageTile extends StatelessWidget {
  final String message;
  final bool isAi;
  final bool isImage;
  final bool isSecond;

  const ChatMessageTile(
      {super.key,
      required this.message,
      required this.isAi,
      required this.isImage,
      this.isSecond = false});

  factory ChatMessageTile.fromModel(
      ChatMessageModel chatModel, bool? isSecond) {
    return ChatMessageTile(
      isSecond: isSecond ?? false,
      message: chatModel.message,
      isAi: chatModel.is_ai,
      isImage: chatModel.is_image,
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
                padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
                child: isSecond
                    ? const SizedBox(
                        width: 50,
                        height: 50,
                      )
                    : Image.asset(
                        "assets/image/logo/logo.png",
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
                    decoration: BoxDecoration(
                        color: theme.appColors.userInputBackground,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                            bottomRight: Radius.circular(32))),
                    child: Text(
                      message,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 16),
                    child: Text(
                      "03 : 37 PM",
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
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: isImage
                        ? Image.network(
                            message,
                            width: 269,
                            height: 269,
                            fit: BoxFit.cover,
                          )
                        : Text(message,
                            style: FontSizes.getCapsuleStyle()
                                .copyWith(fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 16.0),
                    child: Text(
                      "03 : 37 PM",
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
