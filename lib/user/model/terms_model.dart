class Terms {
  final bool submitted;
  final bool all;
  final bool one;
  final bool two;
  final bool three;
  final bool four;

  Terms({
    this.submitted = false,
    this.all = false,
    this.one = false,
    this.two = false,
    this.three = false,
    this.four = false,
  });

  Terms alltoggle(Terms state, bool value) {
    return state.copyWith(
        submitted: value,
        all: value,
        one: value,
        two: value,
        three: value,
        four: value);
  }

  Terms onetoggle(Terms state, bool value) {
    Terms newState = state.copyWith(one: value);
    if (newState.one == true && newState.two == true) {
      newState = newState.copyWith(submitted: true);
    } else {
      newState = newState.copyWith(submitted: false);
    }
    if (newState.one && newState.two && newState.three && newState.four) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms twotoggle(Terms state, bool value) {
    Terms newState = state.copyWith(two: value);
    if (newState.one == true && newState.two == true) {
      newState = newState.copyWith(submitted: true);
    } else {
      newState = newState.copyWith(submitted: false);
    }
    if (newState.one && newState.two && newState.three && newState.four) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms threetoggle(Terms state, bool value) {
    Terms newState = state.copyWith(three: value);
    if (newState.one && newState.two && newState.three && newState.four) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms fourtoggle(Terms state, bool value) {
    Terms newState = state.copyWith(four: value);
    if (newState.one && newState.two && newState.three && newState.four) {
      newState = newState.copyWith(all: true);
    } else {
      newState = newState.copyWith(all: false);
    }
    return newState;
  }

  Terms copyWith({
    bool? submitted,
    bool? all,
    bool? one,
    bool? two,
    bool? three,
    bool? four,
  }) {
    return Terms(
      submitted: submitted ?? this.submitted,
      all: all ?? this.all,
      one: one ?? this.one,
      two: two ?? this.two,
      three: three ?? this.three,
      four: four ?? this.four,
    );
  }
}
