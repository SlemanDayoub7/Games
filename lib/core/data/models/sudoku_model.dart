import 'dart:math';

class SudokuModel {
  List<List<int>> grid;
  List<List<int>> solution;

  SudokuModel()
      : grid = List.generate(9, (_) => List.filled(9, 0)),
        solution = List.generate(9, (_) => List.filled(9, 0));

  void setValue(int row, int col, int value) {
    grid[row][col] = value;
  }

  int getValue(int row, int col) {
    return grid[row][col];
  }

  void generatePuzzle() {
    _fillGrid();
    _removeNumbers();
  }

  void _fillGrid() {
    _fillDiagonal();
    _fillRemaining(0, 0);
  }

  void _fillDiagonal() {
    for (int i = 0; i < 9; i += 3) {
      _fillBox(i, i);
    }
  }

  void _fillBox(int row, int col) {
    List<int> numbers = List.generate(9, (index) => index + 1)
      ..shuffle(Random());
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        grid[row + i][col + j] = numbers[i * 3 + j];
      }
    }
  }

  bool _fillRemaining(int row, int col) {
    if (row == 8 && col == 9) return true;
    if (col == 9) {
      row++;
      col = 0;
    }
    if (grid[row][col] != 0) return _fillRemaining(row, col + 1);

    for (int num = 1; num <= 9; num++) {
      if (_isSafe(row, col, num)) {
        grid[row][col] = num;
        if (_fillRemaining(row, col + 1)) return true;
        grid[row][col] = 0; // Backtrack
      }
    }
    return false;
  }

  bool _isSafe(int row, int col, int num) {
    return _isRowSafe(row, num) &&
        _isColSafe(col, num) &&
        _isBoxSafe(row - row % 3, col - col % 3, num);
  }

  bool _isRowSafe(int row, int num) {
    for (int col = 0; col < 9; col++) {
      if (grid[row][col] == num) return false;
    }
    return true;
  }

  bool _isColSafe(int col, int num) {
    for (int row = 0; row < 9; row++) {
      if (grid[row][col] == num) return false;
    }
    return true;
  }

  bool _isBoxSafe(int boxStartRow, int boxStartCol, int num) {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (grid[row + boxStartRow][col + boxStartCol] == num) return false;
      }
    }
    return true;
  }

  void _removeNumbers() {
    int count = 20; // Number of cells to remove
    Random random = Random();
    while (count > 0) {
      int i = random.nextInt(9);
      int j = random.nextInt(9);
      if (grid[i][j] != 0) {
        grid[i][j] = 0; // Remove the number
        count--;
      }
    }
  }
}
