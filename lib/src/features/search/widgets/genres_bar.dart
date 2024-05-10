import 'package:app/src/features/search/widgets/genres_card.dart';
import 'package:app/src/models/series.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const int itemsPerSlide = 10;

class GenresBar extends StatelessWidget {
  const GenresBar(
      {super.key, required this.listGenres, required this.filterGenres});

  final List<Genres> listGenres;
  final void Function(Genres) filterGenres;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 50;
    int itemCount = ((width / listGenres.length) / itemsPerSlide).ceil();
    
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (context, firstIndex, secondIndex) {
        final int first = firstIndex * itemCount;
        final int second = first + itemCount >= listGenres.length
            ? first + listGenres.length - itemCount
            : first + itemCount;

        return Row(
          children: [

            ...listGenres
                .sublist(first, second)
                .map((genres) => Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GenresCard(
                    genre: genres,
                    width: (width / itemCount) - 25,
                    height: height,
                    genresName: genres.name ?? "",
                    filterGenres: filterGenres),
                const SizedBox(
                  width: 10,
                )
              ],
            ))
          ],
        );
      },
      options: CarouselOptions(
        height: height,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
    );
  }
}
