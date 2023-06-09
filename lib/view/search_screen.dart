import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/playList_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlayList> playList = PlayList.playList;
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
          body: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 35.0, bottom: 20.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            CupertinoIcons.back,
                            color: Colors.grey,
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Recent favorites",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: playList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(playList[index].imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: ListTile(
                              title: Text(
                                playList[index].title,
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                playList[index].song.length.toString(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
