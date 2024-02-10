import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/styles/color_schemes.dart';
import 'package:movieapp/core/styles/text_theme.dart';
import 'package:movieapp/init_all.dart';
import 'package:movieapp/init_main.dart';
import 'package:movieapp/movie_app/features/persistant_nav/presentation/persistant_nav.dart';

void main() async {
  initMain();
  await initAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        textTheme: lightTextTheme,
      ),
      home: PersistentNavBar(selectedTabIndex: 1),
    );
  }
}
