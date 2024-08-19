import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserDetailModel>((ref) => UserDetailModel());

class UserDetailModel {
  final String? userId;
  final bool? isVerified;

  UserDetailModel({
    this.userId,
    this.isVerified,
  });

  UserDetailModel copyWith({
    String? userId,
    bool? isVerified,
  }) {
    return UserDetailModel(
      userId: userId ?? this.userId,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
