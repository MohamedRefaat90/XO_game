import 'package:flutter/material.dart';

import 'GameLogic.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool switched = false;

  String activePlayer = "X";
  String result = "";
  int turn = 0;
  bool gameOver = false;

  TextStyle txtStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(children: [
                Switch(),
                player(context),
                game_Bord(context),
                viewResult(),
                againButton()
              ])
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(),
                        player(context),
                        viewResult(),
                        againButton(),
                      ],
                    ),
                  ),
                  game_Bord(context)
                ],
              ),
      ),
    );
  }

  Container againButton() {
    return Container(
      width: 210,
      height: 50,
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.replay),
        label: const Text(
          "Play Again",
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          setState(() {
            Player.playerX = [];
            Player.playerO = [];
            activePlayer = "X";
            result = "";
            turn = 0;
            gameOver = false;
          });
        },
      ),
    );
  }

  Text viewResult() => Text(result,
      style: txtStyle.copyWith(fontSize: MediaQuery.of(context).orientation == Orientation.portrait? 50 : 40));

  Expanded game_Bord(BuildContext context) {
    return Expanded(
        child: GridView.count(
      padding: const EdgeInsets.all(8),
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(
          9,
          (index) => InkWell(
                onTap: gameOver ? null : () => onTap(index),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    Player.playerX.contains(index)
                        ? "X"
                        : Player.playerO.contains(index)
                            ? "O"
                            : "",
                    style: TextStyle(
                        color: Player.playerX.contains(index)
                            ? Theme.of(context).splashColor
                            : Colors.pink,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
    ));
  }

  DefaultTextStyle player(BuildContext context) {
    return DefaultTextStyle(
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("IT'S "),
            Text(activePlayer,
                style: TextStyle(
                    color: activePlayer == "X"
                        ? Theme.of(context).splashColor
                        : Colors.pink)),
            const Text(" TURN"),
          ],
        ));
  }

  StatefulBuilder Switch() {
    return StatefulBuilder(
      builder: (context, setState) => SwitchListTile.adaptive(
        value: switched,
        onChanged: (val) {
          setState(() => switched = val);
        },
        title: Text("Two Player ON/OFF", style: txtStyle),
      ),
    );
  }

  onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      changePlayer();
    }
    if (switched == false && gameOver == false) {
      await game.autoPlay(activePlayer);
      changePlayer();
    }
  }

  void changePlayer() {
    setState(() => activePlayer = activePlayer == "X" ? "O" : "X");

    turn++;

    String winnerPlayer = game.checkWinner();

    if (winnerPlayer != "") {
      gameOver = true;
      result = "The Winner is $winnerPlayer";
    } else if (turn == 9) {
      result = "It's Draw";
    }
  }
}
