import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class ScoreText extends StatelessWidget {
  final String player;
  final String score;

  const ScoreText({
    super.key,
    required this.player,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth(36)),
      child: Container(
        width: screenWidth(1.8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.grey.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: player + " wins : ",
              styleType: TextStyleType.TITLE,
              textColor: Colors.black,
            ),
            CustomText(
              text: score,
              styleType: TextStyleType.SUBTITLE,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
