class BaseUserModel {
  final String email;
  final String password;

  BaseUserModel({required this.email, required this.password});
}

class LoginUserModel extends BaseUserModel {
  LoginUserModel({required String email, required String password})
      : super(email: email, password: password);
}

class SignupUserModel extends BaseUserModel {
  final String nickname;

  SignupUserModel({
    required String email,
    required String password,
    required this.nickname,
  }) : super(email: email, password: password);
}
