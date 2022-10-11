import 'dart:math';

class Player {
  static List<int> playerX = [];
  static List<int> playerO = [];
  static List resultList = [];
}

@override
extension Cont on List<int> {
  bool containsAll(int x, int y, [z]) {
    return this.contains(x) && this.contains(y) && this.contains(z);
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }

    Player.resultList = [...Player.playerX, ...Player.playerO];
  }

  String checkWinner() {
    late String winner;

    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(2, 4, 6) ||
        Player.playerX.containsAll(0, 4, 8)) {
      winner = "X";
    } else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(2, 4, 6) ||
        Player.playerO.containsAll(0, 4, 8)) {
      winner = "O";
    } else {
      return "";
    }

    return winner;
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyList = [];

    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyList.add(i);
      }
    }

// Start & Center
    if (Player.playerO.containsAll(0, 1) && emptyList.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(3, 4) && emptyList.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(6, 7) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(0, 3) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(1, 4) && emptyList.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(2, 5) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(0, 4) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(2, 4) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(0, 2) && emptyList.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(3, 5) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(6, 8) && emptyList.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(0, 6) && emptyList.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(1, 7) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 8) && emptyList.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(0, 8) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 6) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(1, 2) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 5) && emptyList.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(7, 8) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(3, 6) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 7) && emptyList.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(5, 8) && emptyList.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(4, 8) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(4, 6) && emptyList.contains(2)) {
      index = 2;
    }

// Start & Center
    if (Player.playerX.containsAll(0, 1) && emptyList.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(3, 4) && emptyList.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(6, 7) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(0, 3) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(1, 4) && emptyList.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(2, 5) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(0, 4) && emptyList.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(2, 4) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(0, 2) && emptyList.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(3, 5) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(6, 8) && emptyList.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(0, 6) && emptyList.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(1, 7) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 8) && emptyList.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(0, 8) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 6) && emptyList.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(1, 2) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 5) && emptyList.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(7, 8) && emptyList.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(3, 6) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 7) && emptyList.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(5, 8) && emptyList.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(4, 8) && emptyList.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(4, 6) && emptyList.contains(2)) {
      index = 2;
    } else {
      Random random = Random();
      int randomIndex = random.nextInt(emptyList.length);
      index = emptyList[randomIndex];
    }
    playGame(index, activePlayer);
  }
}
