import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/model/playList_model.dart';
import 'package:music_player/model/song_model.dart';
import 'package:music_player/view/song_screen.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> song = Song.song;
  List<PlayList> playList = PlayList.playList;
  final searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 30, top: 10),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.format_align_center,
                          color: Colors.grey,
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Search",
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Trending Right Now",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                //trending
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: song.length,
                    itemBuilder: (context, index) {
                      return SongCard(song: song[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple,
                            ),
                            height: 40,
                            child: const Center(
                              child: Text(
                                "Trending Right Now",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: Hive.box("favorites").listenable(),
                            builder: (context, box, child) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: song.length,
                                itemBuilder: (context, index) {
                                  final list = song[index];
                                  final isfavorite = box.get(index) != null;

                                  //for search apear
                                  final title = song[index].tilte;
                                  if (searchController.text.isEmpty) {
                                    return ListTile(
                                      onTap: () {
                                        Get.to(SongScreen(song: list));
                                      },
                                      leading: Image.asset(
                                        list.coverUrl,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Text(
                                        song[index].desc,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.grey.shade700,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(title)
                                        ],
                                      ),
                                      trailing: IconButton(
                                          onPressed: () async {
                                            if (isfavorite) {
                                              await box.clear();
                                            } else {
                                              await box.put(index, list.tilte);
                                            }
                                          },
                                          icon: Icon(
                                            isfavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red,
                                          )),
                                    );
                                    //search result
                                  } else if (title.toLowerCase().contains(
                                      searchController.text.toString())) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(list.coverUrl),
                                      ),
                                      title: Text(title),
                                    );
                                  } else {
                                    return const Center();
                                  }
                                },
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
