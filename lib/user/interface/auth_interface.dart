abstract class Isignup {
  Future<dynamic> signup(String email, String password, String nickname);
}

abstract class ILogin {
  Future<dynamic> login(String email, String password);
}

abstract class IAuthService {
  Isignup? get signupService;
  ILogin get loginService;
}
