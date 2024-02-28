class UserSignUpModel {
  final String code;
  final String msg;
  final String result;

  UserSignUpModel({
    required this.code,
    required this.msg,
    required this.result,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) {
    return UserSignUpModel(
      code: json['code'] as String,
      msg: json['msg'] as String,
      result: json['result'] as String,
    );
  }
}
