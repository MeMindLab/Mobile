import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserDetailModel>((ref) => UserDetailModel());

class UserDetailModel {
  final int? userId;
  final bool? isVerified;

  UserDetailModel({
    this.userId,
    this.isVerified,
  });

  UserDetailModel copyWith({
    int? userId,
    bool? isVerified,
  }) {
    return UserDetailModel(
      userId: userId ?? this.userId,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
