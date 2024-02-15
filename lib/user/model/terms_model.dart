class Terms {
  final bool submitted;
  final bool all;
  final bool service;
  final bool personalInfo;
  final bool appPush;
  final bool advertising;

  Terms({
    this.submitted = false,
    this.all = false,
    this.service = false,
    this.personalInfo = false,
    this.appPush = false,
    this.advertising = false,
  });

  Terms alltoggle(Terms state, bool value) {
    return state.copyWith(
        submitted: value,
        all: value,
        service: value,
        personalInfo: value,
        appPush: value,
        advertising: value);
  }

  Terms serviceToggle(Terms state, bool value) {
    Terms newState = state.copyWith(service: value);
    if (newState.service == true && newState.personalInfo == true) {
      newState = newState.copyWith(submitted: true);
    } else {
      newState = newState.copyWith(submitted: false);
    }
    if (newState.service &&
        newState.personalInfo &&
        newState.appPush &&
        newState.advertising) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms personalInfoToggle(Terms state, bool value) {
    Terms newState = state.copyWith(personalInfo: value);
    if (newState.service == true && newState.personalInfo == true) {
      newState = newState.copyWith(submitted: true);
    } else {
      newState = newState.copyWith(submitted: false);
    }
    if (newState.service &&
        newState.personalInfo &&
        newState.appPush &&
        newState.advertising) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms appPushToggle(Terms state, bool value) {
    Terms newState = state.copyWith(appPush: value);
    if (newState.service &&
        newState.personalInfo &&
        newState.appPush &&
        newState.advertising) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms advertisingToggle(Terms state, bool value) {
    Terms newState = state.copyWith(advertising: value);
    if (newState.service &&
        newState.personalInfo &&
        newState.appPush &&
        newState.advertising) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms copyWith({
    bool? submitted,
    bool? all,
    bool? service,
    bool? personalInfo,
    bool? appPush,
    bool? advertising,
  }) {
    return Terms(
      submitted: submitted ?? this.submitted,
      all: all ?? this.all,
      service: service ?? this.service,
      personalInfo: personalInfo ?? this.personalInfo,
      appPush: appPush ?? this.appPush,
      advertising: advertising ?? this.advertising,
    );
  }
}
