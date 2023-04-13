import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dicee',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var dicesList = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];
  int chosen1 = 0;
  int chosen2 = 0;

  int score = 0;
  int maxScore = 0;
  @override
  void initState() {
    super.initState();
    chosen1 = Random().nextInt(6);
    chosen2 = Random().nextInt(6);
  }

  void rollDice() {
    setState(() {
      chosen1 = Random().nextInt(6);
      chosen2 = Random().nextInt(6);
    });
  }

  void equal() {
    setState(() {
      if (chosen1 == chosen2) {
        score += 1;
        rollDice();
      } else {
        maxScore = max(score, maxScore);
        rollDice();
        score = 0;
      }
    });
  }

  void notEqual() {
    setState(() {
      if (chosen1 != chosen2) {
        score += 1;
        rollDice();
      } else {
        maxScore = max(score, maxScore);
        rollDice();
        score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(dicesList[chosen1]),
                ),
                Expanded(
                  child: Image.asset(dicesList[chosen2]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    equal();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    side: BorderSide.none,
                  ),
                  child: const Text(
                    'Equal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    notEqual();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    side: BorderSide.none,
                  ),
                  child: const Text(
                    'Not Equal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Max Score: $maxScore',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
