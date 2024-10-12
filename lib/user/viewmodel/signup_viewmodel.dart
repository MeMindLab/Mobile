import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:me_mind/common/component/dialog/d_bottom_sheet.dart';
import 'package:me_mind/common/component/dialog/w_bottom_sheet_content.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/user/services/signup_service.dart';
import 'package:me_mind/user/view/signup_screen.dart';
import 'package:me_mind/utils/permission.dart';

class SignUpViewModel {
  String? signUpViewModelMessage;
  bool? isTrue;
  String? errorEmailText;
  String? errorNameText;
  String? errorReferralText;

  Future signUpUser(
    String email,
    String nickname,
    String password,
    String referral, {
    required BuildContext context,
    required bool isAdvertise,
    required bool isAppPush,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isAppPush) {
      String today = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
      await BottomSheets(
          context: context,
          bodies: BottomSheetContent(
              title: "광고성 정보 수신동의 처리 결과",
              body: "전송자 : memind\n일시 : $today\n내용 : 수신동의 처리 완료",
              action: RoundedButton(
                text: "확인",
                onPressed: () {
                  isTrue = true;
                  Navigator.pop(context);
                },
              ))).show();
    }
    if (isTrue != true && isAppPush) return;
    if (isAppPush) {
      var permissionStatus =
          await DevicePermission().accessNotification(context: context);

      if (permissionStatus == PermissionStatus.denied) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignUpScreen(isOnBoarding: false)));
        return;
      }
      await prefs.setBool('adverTisingAccept', isAdvertise);
      await prefs.setBool('appPushAccept', isAppPush);
    }

    final result =
        await SignupService().signup(email, nickname, password, referral);

    if (result["success"]) {
      errorEmailText = null;
      errorNameText = null;
      errorReferralText = null;
      return {
        "success": true,
        "email": errorEmailText,
        "name": errorNameText,
        "referral": errorReferralText
      };
    } else {
      if (result["message"] == "Invalid Email") {
        errorEmailText = "이미 가입된 이메일 주소입니다";
      } else if (result["message"] == "Invalid Nikname") {
        errorNameText = "이미 존재하는 닉네임입니다";
      } else if (result["message"] == "Invalid nickname and email") {
        errorEmailText = "이미 가입된 이메일 주소입니다";
        errorNameText = "이미 존재하는 닉네임입니다";
      } else if (result["message"] == "Referrer not found") {
        errorReferralText = "잘못된 추천인 코드입니다";
      }

      return {
        "success": false,
        "email": errorEmailText,
        "name": errorNameText,
        "referral": errorReferralText
      };
    }
  }
}
