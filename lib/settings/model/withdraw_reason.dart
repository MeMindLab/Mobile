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

  bool isNotCheck() {
    if (inconveninece == false &&
        point == false &&
        disabled == false &&
        userInfo == false &&
        custom == false) {
      return true;
    } else {
      return false;
    }
  }

  WithdrawReason update({
    bool? inconveninece,
    bool? point,
    bool? disabled,
    bool? userInfo,
    bool? custom,
  }) {
    return copyWith(
        custom: custom,
        disabled: disabled,
        inconveninece: inconveninece,
        point: point,
        userInfo: userInfo);
  }

  List getReason({String? text}) {
    List<String> reasonBox = [];
    if (inconveninece == true) {
      reasonBox.add("이용이 불편하고 장애가 많아요");
    }
    if (point == true) {
      reasonBox.add("포인트를 다 써버렷어요");
    }
    if (disabled == true) {
      reasonBox.add("자주 사용하지 않을 것 같아요");
    }
    if (userInfo == true) {
      reasonBox.add("개인 정보가 걱정돼요");
    }
    if (custom == true) {
      reasonBox.add(text!);
    }
    return reasonBox;
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
