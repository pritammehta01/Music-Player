import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playState = snapshot.data;
              final processingState = playState!.processingState;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!audioPlayer.playing) {
                return IconButton(
                    onPressed: audioPlayer.play,
                    icon: const Icon(
                      Icons.play_circle_fill_outlined,
                      color: Colors.white,
                      size: 75.0,
                    ));
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                    onPressed: audioPlayer.pause,
                    icon: const Icon(
                      Icons.pause_circle,
                      color: Colors.white,
                      size: 75.0,
                    ));
              } else {
                return IconButton(
                    onPressed: () => audioPlayer.seek(Duration.zero,
                        index: audioPlayer.effectiveIndices!.first),
                    icon: const Icon(
                      Icons.replay_circle_filled,
                      color: Colors.white,
                      size: 75.0,
                    ));
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}
