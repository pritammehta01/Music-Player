class Song {
  final String tilte;
  final String desc;
  final String url;
  final String coverUrl;

  Song(
      {required this.tilte,
      required this.desc,
      required this.url,
      required this.coverUrl});
  static List<Song> song = [
    Song(
      tilte: "Ncs",
      desc: "nonCopyRight",
      url: "assets/music/1.mp3",
      coverUrl: "assets/images/1.jpg",
    ),
    Song(
      tilte: "AlanWalker",
      desc: "themeSong",
      url: "assets/music/3.mp3",
      coverUrl: "assets/images/4.jpg",
    ),
    Song(
      tilte: "Arijeet",
      desc: "HindiSong",
      url: "assets/music/2.mp3",
      coverUrl: "assets/images/3.jpg",
    )
  ];
}
