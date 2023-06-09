import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/view/song_screen.dart';

import '../model/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(song.coverUrl), fit: BoxFit.cover)),
        ),
        InkWell(
          onTap: () {
            Get.to(SongScreen(song: song));
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple.withOpacity(0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      song.tilte,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.music_note,
                          color: Colors.white,
                        ),
                        Text(
                          song.desc,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
