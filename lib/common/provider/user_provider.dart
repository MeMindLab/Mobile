import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:me_mind/settings/model/user_info_model.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';

// final userProvider = StateProvider<UserDetailModel>((ref) => UserDetailModel());
final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserDetailModel>((ref) {
  final notifier = UserStateNotifier();
  return notifier;
});

class UserStateNotifier extends StateNotifier<UserDetailModel> {
  UserStateNotifier() : super(UserDetailModel()) {
    userInit();
  }

  userInit() async {
    final userInfo = await UserInfoService().findUser();

    if (userInfo is! UserInfoModel) return;

    state = UserDetailModel().copyWith(
        userId: userInfo.id,
        isVerified: userInfo.isVerified,
        email: userInfo.email!,
        name: userInfo.nickname,
        phoneNumber: userInfo.mobile,
        referralCode: userInfo.referralCode);
  }

  userLogout() {
    state = UserDetailModel();
  }
}

class UserDetailModel {
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final bool? isVerified;
  final String? name;
  final String? referralCode;

  UserDetailModel(
      {this.userId,
      this.email,
      this.phoneNumber,
      this.isVerified,
      this.name,
      this.referralCode});

  UserDetailModel copyWith({
    String? userId,
    String? email,
    String? phoneNumber,
    bool? isVerified,
    String? name,
    String? referralCode,
  }) {
    return UserDetailModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      name: name ?? this.name,
      referralCode: referralCode ?? this.referralCode,
    );
  }
}
