import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/models/series.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key, required this.listFavorites});

  final List<Series> listFavorites;

  @override
  Widget build(BuildContext context) {
    int itemCount = (listFavorites.length / 3).ceil();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Favorites",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: 10,
        ),
        listFavorites.isEmpty
            ? const Text(
                "Nothing to show",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            : CarouselSlider.builder(
                itemCount: itemCount,
                itemBuilder: (context, index1, index2) {
                  final int first = index1 * 3;
                  final int? second = (first < listFavorites.length - 1 &&
                          index1 <= (listFavorites.length / 3).round())
                      ? first + 1
                      : null;
                  final int? third = (first < listFavorites.length - 2 &&
                          index1 <= (listFavorites.length / 3).round() - 1)
                      ? first + 2
                      : null;

                  return Row(
                    children: [first, second, third]
                        .map(
                          (idx) => Expanded(
                              flex: 1,
                              child: idx != null
                                  ? HomeSeriesCard(
                                      images: listFavorites[idx].images,
                                      title: listFavorites[idx].title.mainTitle,
                                      index: idx,
                                      rating: false,
                                    )
                                  : Container()),
                        )
                        .toList(),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                ),
              )
      ],
    );
  }
}
