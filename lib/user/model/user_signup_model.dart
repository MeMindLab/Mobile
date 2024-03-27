class UserSignUpModel {
  final String msg;

  UserSignUpModel({
    required this.msg,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) {
    return UserSignUpModel(
      msg: json['msg'] as String,
    );
  }
}
