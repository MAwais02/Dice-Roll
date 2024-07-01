import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final String winner;
  const GameOverScreen({super.key, required this.winner});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 117, 86, 81),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Winner is $winner !!\n Congratulations ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text("game over", style: TextStyle(fontSize: 20)),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous scr
              },
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Retry"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
