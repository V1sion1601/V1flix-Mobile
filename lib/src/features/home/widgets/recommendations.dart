import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//Models
import 'package:app/src/models/series.dart';

class ListRecommendations extends StatelessWidget {
  const ListRecommendations({super.key, required this.listSeries});

  final List<Series> listSeries;

  @override
  Widget build(BuildContext context) {
    int itemCount = (listSeries.length / 3).ceil();

    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (context, index1, index2) {
        final int first = index1 * 3;
        final int? second = (first < listSeries.length - 1 &&
                index1 <= (listSeries.length / 3).round())
            ? first + 1
            : null;
        final int? third = (first < listSeries.length - 2 &&
                index1 <= (listSeries.length / 3).round() - 1)
            ? first + 2
            : null;

        return Row(
          children: [first, second, third]
              .map(
                (idx) => Expanded(
                    flex: 1,
                    child: idx != null
                        ? HomeSeriesCard(
                            images: listSeries[idx].images,
                            title: listSeries[idx].title.mainTitle,
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
    );
  }
}
