import 'package:flutter/material.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color.fromARGB(255, 29, 5, 100).withOpacity(0.8),
            const Color.fromARGB(255, 4, 16, 41).withOpacity(0.8)
          ])),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Text(
          "Play List",
          style: TextStyle(color: Colors.blue),
        )),
      ),
    );
  }
}
