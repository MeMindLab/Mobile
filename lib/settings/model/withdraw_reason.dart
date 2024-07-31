class WithdrawReason {
  final bool inconveninece;
  final bool point;
  final bool disabled;
  final bool userInfo;
  final bool custom;

  WithdrawReason({
    required this.inconveninece,
    required this.point,
    required this.disabled,
    required this.userInfo,
    required this.custom,
  });

  WithdrawReason update({
    bool? inconveninece,
    bool? point,
    bool? disabled,
    bool? userInfo,
    bool? custom,
  }) {
    if (inconveninece == true) {
      return this.copyWith(
          inconveninece: true,
          point: false,
          disabled: false,
          userInfo: false,
          custom: false);
    } else if (point == true) {
      return copyWith(
          inconveninece: false,
          point: true,
          disabled: false,
          userInfo: false,
          custom: false);
    } else if (disabled == true) {
      return copyWith(
          inconveninece: false,
          point: false,
          disabled: true,
          userInfo: false,
          custom: false);
    } else if (userInfo == true) {
      return copyWith(
          inconveninece: false,
          point: false,
          disabled: false,
          userInfo: true,
          custom: false);
    } else {
      return copyWith(
          inconveninece: false,
          point: false,
          disabled: false,
          userInfo: false,
          custom: true);
    }
  }

  String getReason({String? text}) {
    if (inconveninece == true) {
      return "이용이 불편하고 장애가 많아요";
    } else if (point == true) {
      return "포인트를 다 써버렷어요";
    } else if (disabled == true) {
      return "자주 사용하지 않을 것 같아요";
    } else if (userInfo == true) {
      return "개인 정보가 걱정돼요";
    } else {
      return text!;
    }
  }

  WithdrawReason copyWith({
    bool? inconveninece,
    bool? point,
    bool? disabled,
    bool? userInfo,
    bool? custom,
  }) {
    return WithdrawReason(
      inconveninece: inconveninece ?? this.inconveninece,
      point: point ?? this.point,
      disabled: disabled ?? this.disabled,
      userInfo: userInfo ?? this.userInfo,
      custom: custom ?? this.custom,
    );
  }
}
