import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class XoGameController extends GetxController {
  var board = <String>[].obs;
  var currentPlayer = 'X'.obs;
  var winner = ''.obs;
  var boardSize = 3.obs;
  var isResetting = false.obs;
  var moveHistory = <String, List<int>>{
    'X': [],
    'O': [],
  }.obs;

  // Scores for players X and O
  var scores = <String, int>{
    'X': 0,
    'O': 0,
  }.obs;

  // Limit for wins
  final int winLimit = 5;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void setBoardSize(int size) {
    boardSize.value = size;
    scores['X'] = 0;
    scores['O'] = 0;
    initializeBoard();
  }

  void initializeBoard() async {
    board.value = List.filled(boardSize.value * boardSize.value, '');
    winner.value = '';
    currentPlayer.value = 'X';
    moveHistory['X']!.clear();
    moveHistory['O']!.clear();

    isResetting.value = true;
    Future.delayed(Duration(seconds: 1))
        .then((value) => isResetting.value = false);
  }

  void makeMove(int index) {
    if (board[index] == '' && winner.value == '') {
      board[index] = currentPlayer.value;
      moveHistory[currentPlayer.value]!.add(index);

      if (moveHistory[currentPlayer.value]!.length > boardSize.value) {
        // Remove the first move if there are more moves than necessary
        int firstMoveIndex = moveHistory[currentPlayer.value]!.removeAt(0);
        board[firstMoveIndex] = '';
      }

      if (checkWinner()) {
        winner.value = currentPlayer.value;
        updateScore(currentPlayer.value); // Update score for the winner
        playWinMusic();
        resetGameAfterDelay();
      } else {
        currentPlayer.value = (currentPlayer.value == 'X') ? 'O' : 'X';
      }
    }
  }

  bool checkWinner() {
    int size = boardSize.value;
    List<List<int>> winningCombinations = [];

    // Rows
    for (int i = 0; i < size; i++) {
      winningCombinations.add([for (int j = 0; j < size; j++) i * size + j]);
    }

    // Columns
    for (int i = 0; i < size; i++) {
      winningCombinations.add([for (int j = 0; j < size; j++) j * size + i]);
    }

    // Diagonals
    winningCombinations.add([for (int i = 0; i < size; i++) i * (size + 1)]);
    winningCombinations.add([for (int i = 1; i <= size; i++) i * (size - 1)]);

    for (var combination in winningCombinations) {
      if (board[combination[0]] != '' &&
          combination.every((index) => board[index] == board[combination[0]])) {
        return true;
      }
    }

    if (!board.contains('')) {
      winner.value = 'Draw';
      resetGameAfterDelay();
    }

    return false;
  }

  void updateScore(String player) {
    if (scores.containsKey(player)) {
      scores[player] =
          scores[player]! + 1; // Increment the score for the winner

      // Check if the player has reached the win limit
      if (scores[player]! >= winLimit) {
        triggerWinAnimation(player);
        scores['X'] = scores['O'] = 0;
        return;
      }
    }
  }

  void playWinMusic() async {
    try {
      // Uncomment and use your audio player here
    } catch (e) {
      print('Error playing win music: $e');
    }
  }

  void resetGameAfterDelay() {
    isResetting.value = true;
    Future.delayed(Duration(seconds: 1), () {
      resetGame();
      isResetting.value = false;
    });
  }

  void triggerWinAnimation(String player) {
    // Show a dialog to announce the winner
    Get.dialog(
      AlertDialog(
        title: Text('Winner!'),
        content: Text('$player has reached the win limit and won the game!'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    initializeBoard();
  }
}
