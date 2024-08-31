// ignore_for_file: deprecated_member_use

import 'package:games/ui/views/xo_game/xo_view/xo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:games/app/my_app_controller.dart';
import 'package:games/core/data/repository/shared_prefrence_repository.dart';

import '../../core/translation/app_translation.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return tr("key_please_enter_email");
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) return tr("key_please_enter_valid_email");
  return null;
}

String? customValidate(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  }
  return null;
}

String? validatePhoneNumber(String? value, String countryCode) {
  if (value!.isEmpty) {
    return tr("key_please_enter_your_phone");
  }
  if (!value.startsWith(countryCode)) {
    return '${tr("key_phone_number_not_valid")} ${countryCode}';
  }
  return null;
}

String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return tr('key_please_confirm_your_password');
  }
  if (value != password) return tr('key_password_not_complete_match');
  return null;
}

Color convertColorStringToColor(String colorString) {
  String hexColor = colorString.replaceAll('#', '');
  int colorValue = int.parse('0xFF$hexColor');
  return Color(colorValue);
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return tr("key_please_enter_password");
  }
  if (value.length < 8) return tr('key_please_enter_valid_password');
  return null;
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
XoGameController xoGameController = Get.find<XoGameController>();

MyAppController get baseController => Get.find<MyAppController>();
