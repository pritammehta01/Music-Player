import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/view/home_screen.dart';
import 'package:music_player/view/playlist_screen.dart';
import 'package:music_player/widgets/bottom_nav_bar.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("favorites");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      getPages: [
        GetPage(name: "/", page: () => const BottomNavBar()),
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/playList", page: () => const PlayListScreen()),
      ],
    );
  }
}
