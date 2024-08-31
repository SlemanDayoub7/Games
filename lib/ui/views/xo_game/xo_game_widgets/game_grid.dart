import 'package:games/ui/shared/colors.dart';
import 'package:games/ui/shared/custom_widgets/custom_text.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int size = xoGameController.boardSize.value;
      return AnimatedScale(
        scale: xoGameController.isResetting.value ? 0.0 : 1.0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          opacity: xoGameController.isResetting.value ? 0.0 : 1.0,
          duration: Duration(milliseconds: 300),
          child: Container(
            height: screenWidth(1),
            width: screenWidth(1),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(screenWidth(20)),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size,
                childAspectRatio: 1.0,
              ),
              itemCount: size * size,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    xoGameController.makeMove(index);
                  },
                  child: Obx(() => Container(
                        margin: EdgeInsets.all(screenWidth(45)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: index % 2 == 0
                                ? [Colors.grey[300]!, Colors.grey[500]!]
                                : [Colors.black54, Colors.black87],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border:
                              Border.all(width: 2, color: AppColors.whiteColor),
                        ),
                        child: Center(
                            child: xoGameController.board[index] == ''
                                ? SizedBox()
                                : SvgPicture.asset(
                                    height: xoGameController.boardSize == 3
                                        ? screenWidth(10)
                                        : xoGameController.boardSize == 5
                                            ? screenWidth(15)
                                            : screenWidth(20),
                                    width: xoGameController.boardSize == 3
                                        ? screenWidth(10)
                                        : xoGameController.boardSize == 5
                                            ? screenWidth(15)
                                            : screenWidth(20),
                                    "assets/svgs/${xoGameController.board[index].toLowerCase()}_" +
                                        (index % 2 == 0 ? "black" : "white") +
                                        ".svg")
                            //  CustomText(
                            //   text: xoGameController.board[index],
                            //   textColor:
                            //       index % 2 == 0 ? Colors.black : Colors.white,
                            //   styleType: TextStyleType.CUSTOM,
                            //   fontSize:
                            // xoGameController.boardSize == 3
                            //       ? screenWidth(10)
                            //       : xoGameController.boardSize == 5
                            //           ? screenWidth(15)
                            //           : screenWidth(20),
                            // ),
                            ),
                      )),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
