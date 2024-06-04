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
