import 'dart:ui';
import 'package:games/ui/shared/colors.dart';
import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:games/ui/views/xo_game/xo_game_widgets/game_grid.dart';
import 'package:games/ui/views/xo_game/xo_game_widgets/score_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: CustomText(
          text: 'Tic-Tac-Toe',
          styleType: TextStyleType.TITLE,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: screenWidth(1),
        height: screenHeight(1),
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              "assets/pngs/background_1.jpg",
              fit: BoxFit.cover,
              width: screenWidth(1),
              height: screenHeight(1),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth(4)),
              child: Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScoreText(
                        player: "X",
                        score: xoGameController.scores['X'].toString(),
                      ),
                      ScoreText(
                        player: "O",
                        score: xoGameController.scores['O'].toString(),
                      ),
                      GameGrid()
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
