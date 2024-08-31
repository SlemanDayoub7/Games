import 'package:games/ui/shared/colors.dart';
import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:games/ui/views/xo_game/xo_view/xo_controller.dart';
import 'package:games/ui/views/xo_game/xo_game_widgets/board_size_button.dart';
import 'package:games/ui/views/xo_game/xo_view/xo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardSizeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/pngs/background.jpg'), // Path to your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(9)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  overflow: TextOverflow.visible,
                  text: 'Choose Board Size:',
                  textColor: Colors.white,
                  styleType: TextStyleType.CUSTOM,
                  fontSize: screenWidth(13),
                ),
                SizedBox(height: screenWidth(20)),
                BoardSizeButton(size: 3, color: Colors.blueGrey),
                SizedBox(height: screenWidth(20)),
                BoardSizeButton(size: 5, color: Colors.teal),
                SizedBox(height: screenWidth(20)),
                BoardSizeButton(size: 7, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
