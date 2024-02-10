import "dart:math";

import "package:flutter/material.dart";
import "package:movieapp/movie_app/features/watch/entities/model/movies_details.dart";

Widget buildGenreContainer(Genre genre) {
  final List<Color> colorList = [
    Color(0xFF15D2BC),
    Color(0xFFE26CA5),
    Color(0xFF564CA3),
    Color(0xFFCD9D0F),
    // Add more colors as needed
  ];

  final random = Random();
  final randomColor = colorList[random.nextInt(colorList.length)];

  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: randomColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      genre.name,
      style: TextStyle(color: Colors.white),
    ),
  );
}
