import 'package:flutter/foundation.dart';

class TicTacToeProvider extends ChangeNotifier {
  /*
  V A R I A B L E S
  */

  // winning conditions
  List<List<int>> winConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  // player's turn
  bool _isXturn = true;
  bool get isXturn => _isXturn;

  // x player win
  bool _xPlayerWon = false;
  bool get xPlayerWon => _xPlayerWon;

  // o player win
  bool _oPlayerWon = false;
  bool get oPlayerWon => _oPlayerWon;

  // x player placement
  final List<int> _xPlayer = [];
  List<int> get xPlayer => _xPlayer;

  // o player placement
  final List<int> _oPlayer = [];
  List<int> get oPlayer => _oPlayer;

  // x player character
  int _xPlayerChar = 0;
  int get xPlayerChar => _xPlayerChar;

  // o player character
  int _oPlayerChar = 0;
  int get oPlayerChar => _oPlayerChar;

  // player won
  bool _gameFinish = false;
  bool get gameFinish => _gameFinish;

  /*
  M E T H O D S
  */

  // add index to board
  void addToBoard(int index) {
    // add index to player placement based on turn
    if (_isXturn) {
      if (_xPlayer.length == 3) {
        _xPlayer.removeAt(0);
      }
      _xPlayer.add(index);
    } else {
      if (_oPlayer.length == 3) {
        _oPlayer.removeAt(0);
      }
      _oPlayer.add(index);
    }
    print('xplayer -> $xPlayer');
    checkWinner();
    _isXturn = !_isXturn;
    notifyListeners();
  }

  // check winner
  void checkWinner() {
    List<int> copyXlist = List.from(xPlayer);
    List<int> copyOlist = List.from(oPlayer);

    if (winConditions.any((e) => listEquals(e, copyXlist..sort()))) {
      print('xplayer won');
      _xPlayerWon = true;
      _gameFinish = true;
    } else if (winConditions.any((e) => listEquals(e, copyOlist..sort()))) {
      print('oplayer won');
      _oPlayerWon = true;
      _gameFinish = true;
    }
    notifyListeners();
  }

  // restart game
  void restartGame() {
    _isXturn = true;
    _xPlayerWon = false;
    _oPlayerWon = false;
    _xPlayer.clear();
    _oPlayer.clear();
    _gameFinish = false;
    notifyListeners();
  }

  // select character
  void characterSelect(int index, int player) {
    player == 0
        ? _xPlayerChar = index
        : _oPlayerChar = index;
    notifyListeners();
  }
}
