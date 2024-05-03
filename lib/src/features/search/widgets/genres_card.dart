import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class GenresCard extends StatelessWidget {
  const GenresCard(
      {super.key,
      required this.width,
      required this.height,
      required this.genre,
      required this.genresName,
      required this.filterGenres});

  final double width, height;
  final String genresName;
  final Genres genre;
  final void Function(Genres) filterGenres;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        filterGenres(genre);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        height: height,
        width: width,
        child: Center(
          child: Text(
            genresName ?? "",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
