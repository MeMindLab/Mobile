import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserDetailModel>((ref) => UserDetailModel());

class UserDetailModel {
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final bool? isVerified;
  final String? name;

  UserDetailModel({
    this.userId,
    this.email,
    this.phoneNumber,
    this.isVerified,
    this.name,
  });

  UserDetailModel copyWith({
    String? userId,
    String? email,
    String? phoneNumber,
    bool? isVerified,
    String? name,
  }) {
    return UserDetailModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      name: name ?? this.name,
    );
  }
}
