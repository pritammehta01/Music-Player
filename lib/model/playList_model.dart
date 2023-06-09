// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:music_player/model/song_model.dart';

class PlayList {
  final String title;
  final List<Song> song;
  final String imageUrl;
  PlayList({
    required this.title,
    required this.song,
    required this.imageUrl,
  });
  static List<PlayList> playList = [
    PlayList(
      title: "Non copyright song",
      song: Song.song,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCz0yIpFG9mgsFGOo6o9HwHK9_e76MGGoWmdPCQWOj&s",
    ),
    PlayList(
      title: "Pubg song",
      song: Song.song,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPulTEpkm6hJE5q-oOa3g-XCUQZzA49GGI-E-S_6gUV7L-CWibIpEU4cHZiDxwFmxuI_z7sme66sk&usqp=CAU&ec=48665698",
    ),
    PlayList(
      title: "Hindi Song",
      song: Song.song,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsf1Bm5ElTD5nWTs3LktvV1NMdDpxfkeHKAToenkvi&s",
    )
  ];
}
