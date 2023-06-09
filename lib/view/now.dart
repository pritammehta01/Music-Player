import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Now extends StatefulWidget {
  const Now({super.key});

  @override
  State<Now> createState() => _NowState();
}

class _NowState extends State<Now> {
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setAsset("assets/music/1.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Control(audioPlayer: _audioPlayer),
    );
  }
}

class Control extends StatelessWidget {
  const Control({
    super.key,
    required this.audioPlayer,
  });
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playState = snapshot.data;
        final processingState = playState?.processingState;
        final playing = playState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
              onPressed: audioPlayer.play, icon: const Icon(Icons.play_arrow));
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
              onPressed: audioPlayer.pause,
              icon: const Icon(Icons.pause_rounded));
        }
        return const Icon(
          Icons.play_arrow_rounded,
          size: 80,
          color: Colors.white,
        );
      },
    );
  }
}
