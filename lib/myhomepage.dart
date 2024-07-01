import 'package:dice_game/splashscreen.dart';
import 'package:flutter/material.dart';
import 'gameoverscreen.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB92217),
              Color.fromARGB(255, 144, 24, 15),
            ],
          ),
        ),
        child: const SplashScreen(),
      ),
    );
  }
}

class MyHomePageContent extends StatefulWidget {
  const MyHomePageContent({super.key});

  @override
  State<MyHomePageContent> createState() => _MyHomePageContentState();
}

class _MyHomePageContentState extends State<MyHomePageContent> {
  bool checkWhichPlayerTurn =
      false; // false mean player 1 turn true mean player 2 turn
  int _randomnumber = 1;
  int _randomnumber2 = 1;
  int _player1score = 0;
  int _player2score = 0;
  bool add = false;

  bool checkforturn = false;
  void _getrandomNumber() {
    setState(() {
      _randomnumber = Random().nextInt(6) + 1; // get random between 1 and 6
      if (add) {
        // avoid starting
        _player1score = _player1score + _randomnumber;
      }
      checkWhichPlayerTurn = true;
    });
  }

  void _getrandomNumber2() {
    setState(() {
      _randomnumber2 = Random().nextInt(6) + 1; // get random between 1 and 6
      if (add) {
        _player2score = _player2score + _randomnumber2;
      }

      checkWhichPlayerTurn = false;
    });
  }

  void _restartTheEntireGame() {
    setState(() {
      _player1score = 0;
      _player2score = 0;
      checkWhichPlayerTurn = false;
    });
  }

  Widget player1(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Player #1",
          style: TextStyle(fontSize: 32),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              if (checkWhichPlayerTurn == false) {
                add = true;
                if (_player1score >= 10) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameOverScreen(
                        winner: 'player 1',
                      ),
                    ),
                  );
                  _restartTheEntireGame();
                }
                _getrandomNumber();
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(title: Text('Player 2 Turn'));
                    });
              }
            },
            child: Image.asset(
              'assetss/dice$_randomnumber.png',
              width: 150,
            ),
          ),
        ),
        Text(
          "Player 1 Score : $_player1score",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget player2(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Player #2",
          style: TextStyle(fontSize: 32),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              if (checkWhichPlayerTurn == true) {
                if (_player2score >= 10) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GameOverScreen(winner: 'Player 2'),
                    ),
                  );
                  _restartTheEntireGame();
                }
                _getrandomNumber2();
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(title: Text('Player 1 Turn'));
                    });
              }
            },
            child: Image.asset(
              'assetss/dice$_randomnumber2.png',
              width: 150,
            ),
          ),
        ),
        Text(
          "Player 2 Score : $_player2score",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(209, 229, 126, 112),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              player1(context),
              const Expanded(
                child: SizedBox(),
              ),
              player2(context),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
