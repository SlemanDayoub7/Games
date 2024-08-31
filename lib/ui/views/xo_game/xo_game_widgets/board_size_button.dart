import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:games/ui/views/xo_game/xo_view/xo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardSizeButton extends StatelessWidget {
  final int size;
  final Color color;
  const BoardSizeButton({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        xoGameController.setBoardSize(size);
        Get.to(XoView());
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth(18), horizontal: screenWidth(9)),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      ),
      child: CustomText(
        text: '$size x $size',
        styleType: TextStyleType.SUBTITLE,
        textColor: Colors.white,
      ),
    );
  }
}
