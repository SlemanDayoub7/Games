import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:games/core/enums/dialog_type.dart';
import 'package:games/core/translation/app_translation.dart';
import 'package:games/ui/shared/colors.dart';
import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/custom_widgets/cutsom_button.dart';
import 'package:games/ui/shared/utils.dart';

class CustomDialog {
  static showDialog(DialogType dialogType) {
    Get.defaultDialog(
        title: "",
        contentPadding: EdgeInsets.all(screenWidth(18)),
        backgroundColor: AppColors.whiteColor,
        content: dialogType == DialogType.PAYMENT
            ? Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/svgs/icon_success.svg",
                    width: screenWidth(6.5),
                    height: screenWidth(6.5),
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  CustomText(
                    text: tr("key_payment_completed"),
                    styleType: TextStyleType.TITLE,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: screenWidth(40),
                  ),
                  CustomText(
                      text: tr("key_thank_you_for_purchase_from_our_store")),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  CustomButton(
                    onPress: () {
                      // Get.off(() => MyOrderView());
                    },
                    title: tr("key_my_order"),
                  ),
                  SizedBox(
                    height: screenWidth(30),
                  ),
                  CustomButton(
                    onPress: () {},
                    foreColor: AppColors.blackColor,
                    backColor: AppColors.whiteColor,
                    title: tr("key_back_home"),
                  )
                ],
              )
            : Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/svgs/icon_success.svg",
                    width: screenWidth(6.5),
                    height: screenWidth(6.5),
                  ),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  CustomText(text: tr("key_password_change_successfully")),
                  SizedBox(
                    height: screenWidth(20),
                  ),
                  CustomButton(
                    onPress: () {
                      // Get.off(() => MyOrderView());
                    },
                    title: tr("key_login"),
                  ),
                ],
              ));
  }
}
