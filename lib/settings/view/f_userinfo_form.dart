import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/model/auth_sms_model.dart';
import 'package:me_mind/settings/model/auth_sms_verify_model.dart';
import 'package:me_mind/settings/model/user_info_model.dart';
import 'package:me_mind/settings/services/auth_sms_service.dart';
import 'package:me_mind/settings/services/user_validation_service.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';
import 'package:me_mind/settings/utils/phone_number_formatter.dart';
import 'package:me_mind/settings/view/s_withdraw_check.dart';
import 'package:me_mind/settings/view/w_certify_timer.dart';
import 'package:me_mind/utils/validate.dart';

class UserInfoForm extends ConsumerStatefulWidget {
  final bool isUpdate;
  final Function onUpdate;
  final String userEmail;
  final String userNickname;
  final String? userPhoneNumber;
  final bool isVerified;
  final String? referralCode;
  const UserInfoForm(
      {super.key,
      required this.isUpdate,
      required this.onUpdate,
      required this.userEmail,
      required this.userNickname,
      this.userPhoneNumber,
      required this.isVerified,
      this.referralCode});

  @override
  ConsumerState<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends ConsumerState<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _formAuthKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController phoneController = TextEditingController(text: "");
  String code = "";
  int timerCount = 300;
  bool isAuthCheck = false;
  bool isEmailCheck = false;
  bool isNameCheck = false;
  late Timer _timer;
  late CertifyTimer certifyTimer;
  bool isphoneAuthenticated = false;
  bool isTimerStart = false;
  late bool isAuthenticComplete;
  bool isAuthNumberState = true;
  String? errorNameText;
  String? errorEmailText;
  late String saveName;
  late String saveEmail;
  bool isPhoneButton = false;
  String? errorPhoneAuthText;

  void resetTimer() {
    setState(() {
      _timer.cancel();
      timerCount = 300;
      isphoneAuthenticated = false;
      isTimerStart = false;
    });
  }

  void _startTimer(BuildContext context, theme) {
    timerCount = 300;
    if (false == isTimerStart) {
      setState(() {
        isTimerStart = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCount <= 0) {
          _timer.cancel();
          DialogManager(context: context, type: DialogType.oneButton).show(
            titleText: "인증번호 입력시간이 초과되었습니다.",
            firstButtonText: "확인",
            firstSubmit: () {
              Navigator.pop(context);
            },
          );

          resetTimer();
        } else {
          if (isTimerStart == true) {
            setState(() {
              timerCount--;
            });
          } else {
            _timer.cancel();
            setState(() {
              timerCount = 300;
            });
          }
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    certifyTimer = CertifyTimer(timerCount: timerCount);
    nameController.text = widget.userNickname;
    emailController.text = widget.userEmail;
    phoneController.text = widget.userPhoneNumber ?? "";
    isAuthenticComplete = widget.isVerified;
    _timer = Timer(const Duration(seconds: 0), () {});
    saveName = widget.userNickname;
    saveEmail = widget.userEmail;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFF1F3F8),
              borderRadius: BorderRadius.circular(13.0)),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.5),
                child: Image.asset(
                  'assets/image/logo/logo.png',
                  width: 46,
                  height: 46,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "추천인 코드 ",
                    style: FontSizes.getCapsuleStyle().copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.gray7),
                  ),
                  Text("${widget.referralCode ?? ""} ",
                      style: FontSizes.getCapsuleStyle().copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.gray9)),
                  InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: widget.referralCode ?? ""));
                        DialogManager(
                                context: context, type: DialogType.oneButton)
                            .show(
                                titleText: "추천인 코드 복사완료!",
                                contentText:
                                    "복사한 코드를 친구에게 공유해주세요!\n친구가 나의 추천인 코드로 가입하면\n무료로 레몬을 서로 받을 수 있어요!",
                                firstButtonText: "확인",
                                oneContentTextColor: AppColors.blackColor,
                                firstSubmit: () {
                                  Navigator.of(context).pop();
                                });
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/image/icon/copy.png"),
                          Text(" 복사하기",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blue9)),
                        ],
                      )),
                ],
              ),
              Stack(children: [
                SeetingCustomTextFormField(
                  textEditingController: nameController,
                  bgColor: theme.appColors.seedColor,
                  errorText: null,
                  outlineInputBorder: errorNameText == "error"
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: AppColors.timerColor))
                      : null,
                  maxLength: 10,
                  labelText: "닉네임",
                  validator: (value) {
                    var nicknameResult = CheckValidate().validateName(value);

                    return nicknameResult;
                  },
                  readOnly: widget.isUpdate == false ? true : false,
                  onChanged: (String value) {},
                ),
                if (widget.isUpdate)
                  Positioned(
                    right: 0,
                    top: 36,
                    child: Container(
                      width: 70,
                      height: 35,
                      margin: const EdgeInsets.fromLTRB(0, 5, 7, 5),
                      child: ElevatedButton(
                          child: isNameCheck == true
                              ? SvgPicture.asset(
                                  'assets/svg/icon/check.svg',
                                  colorFilter: ColorFilter.mode(
                                      theme.appColors.seedColor,
                                      BlendMode.srcIn),
                                )
                              : Text(
                                  "확인",
                                  style: FontSizes.getContentStyle()
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                          style: checkButtonStyle(theme, isNameCheck),
                          onPressed: widget.isUpdate
                              ? () async {
                                  if (widget.userNickname ==
                                      nameController.text) {
                                    setState(() {
                                      errorNameText = "error";
                                      isNameCheck = false;
                                    });
                                    return;
                                  }
                                  print(errorNameText);
                                  final result = await UserValidationService()
                                      .checkName(name: nameController.text);

                                  if (result != null) {
                                    setState(() {
                                      isNameCheck = true;
                                      errorNameText = null;
                                    });
                                  } else {
                                    setState(() {
                                      errorNameText = "error";
                                      isNameCheck = false;
                                    });
                                  }
                                }
                              : null),
                    ),
                  ),
              ]),
              const SizedBox(
                height: 12.0,
              ),
              Stack(children: [
                SeetingCustomTextFormField(
                  textEditingController: emailController,
                  bgColor: theme.appColors.seedColor,
                  // errorText: errorEmailText,
                  outlineInputBorder: errorEmailText == "error"
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: AppColors.timerColor))
                      : null,
                  maxLines: 1,
                  suffixWidget: const SizedBox(width: 85),
                  labelText: "이메일",
                  readOnly: widget.isUpdate == false ? true : false,
                  validator: (value) {
                    var emailResult = CheckValidate().validateEmail(value);

                    return emailResult;
                  },
                  onChanged: (String value) {},
                ),
                if (widget.isUpdate)
                  Positioned(
                    right: 0,
                    top: 36,
                    child: Container(
                      width: 70,
                      height: 35,
                      margin: const EdgeInsets.fromLTRB(0, 5, 7, 5),
                      child: ElevatedButton(
                          child: isEmailCheck == true
                              ? SvgPicture.asset(
                                  'assets/svg/icon/check.svg',
                                  colorFilter: ColorFilter.mode(
                                      theme.appColors.seedColor,
                                      BlendMode.srcIn),
                                )
                              : Text(
                                  "확인",
                                  style: FontSizes.getContentStyle()
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                          style: checkButtonStyle(theme, isEmailCheck),
                          onPressed: widget.isUpdate
                              ? () async {
                                  if (widget.userEmail ==
                                      emailController.text) {
                                    setState(() {
                                      errorEmailText = "error";
                                      isEmailCheck = false;
                                    });
                                  }
                                  final result = await UserValidationService()
                                      .checkEmail(email: emailController.text);

                                  if (result != null) {
                                    setState(() {
                                      isEmailCheck = true;
                                      errorEmailText = null;
                                    });
                                  } else {
                                    setState(() {
                                      errorEmailText = "error";
                                      isEmailCheck = false;
                                    });
                                  }
                                }
                              : null),
                    ),
                  ),
              ]),
              const SizedBox(
                height: 12.0,
              ),
              Stack(
                children: [
                  SeetingCustomTextFormField(
                    textEditingController: phoneController,
                    bgColor: theme.appColors.seedColor,
                    labelText: "연락처",
                    enabled: isAuthenticComplete == false,
                    textInputFormatter: [PhoneNumberFormatter()],
                    hintText: isAuthenticComplete
                        ? widget.userPhoneNumber
                        : "번호를 입력해주세요",
                    readOnly: widget.isUpdate == false ? true : false,
                    onChanged: (String value) {
                      if (phoneController.text.length == 13) {
                        setState(() {
                          isPhoneButton = true;
                        });
                      } else {
                        setState(() {
                          isPhoneButton = false;
                        });
                      }
                    },
                  ),
                  Positioned(
                    bottom: 1,
                    right: 0,
                    child: widget.isUpdate && isAuthenticComplete == false
                        ? Container(
                            width: 83,
                            height: 35,
                            margin: const EdgeInsets.fromLTRB(0, 5, 7, 5),
                            child: ElevatedButton(
                              child: Text(
                                isphoneAuthenticated ? "재전송" : "인증요청",
                                style: FontSizes.getContentStyle()
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              onPressed: isPhoneButton
                                  ? () async {
                                      if (isphoneAuthenticated == false) {
                                        setState(() {
                                          isphoneAuthenticated = true;
                                        });
                                        _startTimer(context, theme);
                                        var result = await AuthSmsService()
                                            .sendSms(
                                                phone: phoneController.text);

                                        if (result is! AuthSmsModel) return;
                                      } else {
                                        setState(() {
                                          isTimerStart = false;
                                        });
                                        _timer.cancel();
                                        _startTimer(context, theme);
                                      }
                                    }
                                  : () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                backgroundColor:
                                    phoneController.text.length == 13
                                        ? lightTheme.primaryColor
                                        : AppColors.gray2,
                                elevation: 0,
                                foregroundColor: theme.appColors.iconButton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              isphoneAuthenticated == false
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox(height: 10),
              isphoneAuthenticated
                  ? Form(
                      key: _formAuthKey,
                      child: SizedBox(
                          width: deviceWidth,
                          child: isAuthenticComplete == false
                              ? Stack(children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SeetingCustomTextFormField(
                                          bgColor: theme.appColors.seedColor,
                                          maxLength: 6,
                                          errorText: errorPhoneAuthText,
                                          onChanged: (String value) {
                                            value.length == 6
                                                ? setState(() {
                                                    isAuthCheck = true;
                                                  })
                                                : setState(() {
                                                    isAuthCheck = false;
                                                  });

                                            setState(() {
                                              code = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (isAuthNumberState == false) {
                                              return "인증번호를 확인해주세요";
                                            }
                                            return null;
                                          },
                                          suffixWidget: Align(
                                            widthFactor: 1.0,
                                            heightFactor: 1.0,
                                            child: CertifyTimer(
                                              timerCount: timerCount,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.21,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 0,
                                    child: SizedBox(
                                      width: 75,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          var result = await AuthSmsService()
                                              .sendVerify(
                                                  phone: phoneController.text,
                                                  code: code);
                                          print(result);
                                          if (result == null) {
                                            setState(() {
                                              isAuthNumberState = false;
                                              errorPhoneAuthText =
                                                  "인증번호를 확인해주세요";
                                            });
                                            return;
                                          } else if (result
                                                  is! AuthSmsVerifyModel ||
                                              result.data.valid == false) {
                                            setState(() {
                                              isAuthNumberState =
                                                  result.data.result.valid;
                                            });
                                            _formAuthKey.currentState!
                                                .validate();

                                            return;
                                          }

                                          setState(() {
                                            timerCount = 300;
                                            isAuthenticComplete = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          backgroundColor: isAuthCheck == false
                                              ? theme.appColors
                                                  .grayButtonBackground
                                              : AppColors.blueMain,
                                          elevation: 0,
                                          shadowColor: AppColors.invisibleColor,
                                          foregroundColor:
                                              theme.appColors.iconButton ??
                                                  AppColors.blackColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                        ),
                                        child: Text(
                                          "확인",
                                          style: FontSizes.getContentStyle()
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                              : SizedBox(
                                  width: deviceWidth,
                                  child: SeetingCustomTextFormField(
                                    bgColor: theme.appColors.seedColor,
                                    maxLength: 4,
                                    initialText: code,
                                    onChanged: (String value) {},
                                    suffixWidget: SizedBox(
                                      child: SvgPicture.asset(
                                        'assets/svg/icon/check_all.svg',
                                        width: 25,
                                        height: 25,
                                        fit: BoxFit.scaleDown,
                                        colorFilter: const ColorFilter.mode(
                                            AppColors.blue9, BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                )),
                    )
                  : const SizedBox(),
              isphoneAuthenticated
                  ? const SizedBox(height: 20)
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        widget.isUpdate == false
            ? SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  text: "수정",
                  onPressed: () {
                    setState(() {
                      isNameCheck = false;
                      isEmailCheck = false;
                    });
                    widget.onUpdate(true);
                  },
                ),
              )
            : Row(children: [
                SizedBox(
                  width: deviceWidth * 0.3,
                  child: RoundedButton(
                    borderSide: BorderSide(
                        width: 1, color: theme.appColors.grayButtonBackground),
                    text: "취소",
                    backgroundColor: theme.appColors.seedColor,
                    onPressed: () {
                      widget.onUpdate(false);
                      _formKey.currentState?.reset();
                      setState(() {
                        errorEmailText = null;
                        errorNameText = null;
                      });
                      nameController.text = saveName;
                      emailController.text = saveEmail;
                      phoneController.text = widget.userPhoneNumber ?? "";
                      resetTimer();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    child: RoundedButton(
                      backgroundColor: widget.userPhoneNumber == ""
                          ? (isAuthenticComplete == true ||
                                  isEmailCheck == true ||
                                  isNameCheck == true)
                              ? theme.appColors.blueButtonBackground
                              : theme.appColors.grayButtonBackground
                          : (isEmailCheck || isNameCheck)
                              ? theme.appColors.blueButtonBackground
                              : theme.appColors.grayButtonBackground,
                      text: "저장",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print(ref.watch(lemonStateNotifierProvider));

                          final user = await UserInfoService().putUser(
                              mobile: phoneController.text,
                              email: emailController.text,
                              isVerified: isAuthenticComplete,
                              nickname: nameController.text);

                          if (user is! UserInfoModel) return;
                          await ref
                              .read(userStateNotifierProvider.notifier)
                              .userUpdate(user: user);
                          await ref
                              .read(lemonStateNotifierProvider.notifier)
                              .lemonInit();
                          print(ref.watch(lemonStateNotifierProvider));

                          setState(() {
                            isphoneAuthenticated = false;
                            isNameCheck = false;
                            isEmailCheck = false;
                            saveName = nameController.text;
                            saveEmail = emailController.text;
                          });
                          widget.onUpdate(false);

                          if (isAuthenticComplete == true &&
                              widget.userPhoneNumber == "") {
                            resetTimer();

                            DialogManager(
                                    context: context, type: DialogType.lemon)
                                .show(
                                    titleText: "번호인증을 완료했어요!",
                                    contentText: "비타민이 지급되었습니다.",
                                    firstButtonText: "닫기",
                                    firstSubmit: () {
                                      Navigator.pop(context);
                                    },
                                    secondButtonText: "리포트 발행하러 가기",
                                    secondSubmit: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return const MainScreen();
                                      }));
                                    });
                          }
                        }
                      },
                    ),
                  ),
                )
              ]),
        const Spacer(),
        widget.isUpdate == false
            ? InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => WithdrawCheckScreen()));
                },
                child: Text(
                  "계정 탈퇴하기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.iconBook),
                ),
              )
            : const Text(""),
      ]),
    );
  }

  ButtonStyle checkButtonStyle(theme, bool isTrue) {
    return ElevatedButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      backgroundColor:
          isTrue ? AppColors.blueMain : theme.appColors.grayButtonBackground,
      elevation: 0,
      foregroundColor: theme.appColors.iconButton ?? AppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
    );
  }
}
