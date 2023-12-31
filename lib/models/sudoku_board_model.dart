import 'dart:math';

class SudokuBoard {
  List<int> _sudokuBoard = [];
  List<int> _oryginalSudokuBoard = [];
  final List<int> _preFilledIndexes = [];
  Map<int, List<int>> hints = {};

  SudokuBoard() {
    _resetHintValues();
  }

  void setFieldValue(int index, int value) {
    if (index < 0 || index > 80) {
      return;
    }

    _sudokuBoard[index] = value;
    _removeHints(index, value);
  }

  int getFieldValue(int index) {
    return _sudokuBoard[index];
  }

  bool validate() {
    if (_sudokuBoard.contains(0)) {
      return false;
    }
    for (var i = 0; i < _sudokuBoard.length; i++) {
      int value = _sudokuBoard[i];
      int x = i % 9;
      int y = i ~/ 9;
      int boxX = x ~/ 3;
      int boxY = y ~/ 3;
      int boxOffset = 27 * boxY + 3 * boxX;
      _sudokuBoard[i] = 0;
      for (var i = 0; i < 9; i++) {
        int columnsValues = _sudokuBoard[x + i * 9];
        int rowsValues = _sudokuBoard[y * 9 + i];
        int boxsValues = _sudokuBoard[boxOffset + i % 3 + 9 * (i ~/ 3)];
        if (columnsValues == value ||
            rowsValues == value ||
            boxsValues == value) {
          return false;
        }
      }
      _sudokuBoard[i] = value;
    }
    return true;
  }

  Map<int, List<int>> fillHints() {
    _resetHintValues();
    Map<int, List<int>> newHintsMap = {};
    for (var i = 0; i < 81; i++) {
      newHintsMap[i] = [];
    }

    for (var i = 0; i < _sudokuBoard.length; i++) {
      int value = _sudokuBoard[i];

      if (value != 0) {
        continue;
      }

      List<int> newHints = List.generate(9, (index) => index + 1);

      int x = i % 9;
      int y = i ~/ 9;
      int boxX = x ~/ 3;
      int boxY = y ~/ 3;
      int boxOffset = 27 * boxY + 3 * boxX;

      for (var i = 0; i < 9; i++) {
        int columnsValues = _sudokuBoard[x + i * 9];
        int rowsValues = _sudokuBoard[y * 9 + i];
        int boxsValues = _sudokuBoard[boxOffset + i % 3 + 9 * (i ~/ 3)];
        newHints.remove(columnsValues);
        newHints.remove(rowsValues);
        newHints.remove(boxsValues);
      }

      newHintsMap[i] = newHints;
    }

    return newHintsMap;
  }

  void _removeHints(int index, int value) {
    int x = index % 9;
    int y = index ~/ 9;
    int boxX = x ~/ 3;
    int boxY = y ~/ 3;
    int boxOffset = 27 * boxY + 3 * boxX;

    for (var i = 0; i < 9; i++) {
      hints[x + i * 9]?.remove(value);
      hints[y * 9 + i]?.remove(value);
      hints[boxOffset + i % 3 + 9 * (i ~/ 3)]?.remove(value);
    }
  }

  bool isPredefined(int index) {
    return _preFilledIndexes.contains(index);
  }

  void resetSudokuBoard() {
    _sudokuBoard = List.from(_oryginalSudokuBoard);
    _resetHintValues();
  }

  void loadSudokuBoard(List<int> sudokuBoardInput) {
    _preFilledIndexes.clear();
    for (var i = 0; i < sudokuBoardInput.length; i++) {
      if (sudokuBoardInput[i] != 0) {
        _preFilledIndexes.add(i);
      }
    }
    _sudokuBoard = List.from(sudokuBoardInput);
    _oryginalSudokuBoard = List.from(sudokuBoardInput);
    _resetHintValues();
  }

  void setHints(Map<int, List<int>> newHints) {
    hints = newHints;
  }

  Map<int, List<int>> getHints() {
    return hints;
  }

  void setBoard(List<int> newBoard) {
    _sudokuBoard = newBoard;
  }

  List<int> getBoard() {
    return _sudokuBoard;
  }

  void _resetHintValues() {
    hints = {};
    for (var i = 0; i < 81; i++) {
      hints[i] = [];
    }
  }

  void eraseRandomFields(int number) {
    hints = {};
    for (var i = 0; i < number; i++) {
      while (true) {
        int randomIndex = Random().nextInt(81);
        if (getFieldValue(randomIndex) == 0) {
          continue;
        }
        setFieldValue(randomIndex, 0);
        break;
      }
    }
  }
}
