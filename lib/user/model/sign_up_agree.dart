class SignUpAgree {
  bool isSubmitted;
  bool isAll;
  bool isService;
  bool isPersonalInfo;
  bool isAppPush;
  bool isAdvertising;

  SignUpAgree({
    required this.isSubmitted,
    required this.isAll,
    required this.isService,
    required this.isPersonalInfo,
    required this.isAppPush,
    required this.isAdvertising,
  });

  SignUpAgree copyWith({
    bool? isSubmitted,
    bool? isAll,
    bool? isService,
    bool? isPersonalInfo,
    bool? isAppPush,
    bool? isAdvertising,
  }) {
    return SignUpAgree(
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isAll: isAll ?? this.isAll,
      isService: isService ?? this.isService,
      isPersonalInfo: isPersonalInfo ?? this.isPersonalInfo,
      isAppPush: isAppPush ?? this.isAppPush,
      isAdvertising: isAdvertising ?? this.isAdvertising,
    );
  }
}
