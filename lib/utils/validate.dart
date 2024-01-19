import 'package:flutter/material.dart';

class CheckValidate {
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return '이메일을 입력하세요.';
    } else {
      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      RegExp regExp = RegExp(pattern);
      print(!regExp.hasMatch(value));
      if (!regExp.hasMatch(value)) {
        return '잘못된 이메일 형식입니다.';
      } else {
        return null;
      }
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return '닉네임을 입력하세요.';
    } else {
      if (value.length < 2) {
        return "닉네임은 최소 2글자 이상입니다";
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return '비밀번호를 입력하세요.';
    } else {
      String pattern =
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      } else {
        return null;
      }
    }
  }

  String? validateConfirmPassword(String compare, String value) {
    if (value.isEmpty || compare != value) {
      return '비밀번호가 일치하지 않습니다';
    } else {
      return null;
    }
  }
}
