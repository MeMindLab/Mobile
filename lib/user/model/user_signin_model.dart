class UserSignInModel {
  final String code;
  final String msg;
  final SignInResult result;

  UserSignInModel({
    required this.code,
    required this.msg,
    required this.result,
  });

  factory UserSignInModel.fromJson(Map<String, dynamic> json) {
    return UserSignInModel(
      code: json['code'] as String,
      msg: json['msg'] as String,
      result: SignInResult.fromJson(json['result'] as Map<String, dynamic>),
    );
  }
}

class SignInResult {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  SignInResult({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory SignInResult.fromJson(Map<String, dynamic> json) {
    return SignInResult(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as int,
    );
  }
}
