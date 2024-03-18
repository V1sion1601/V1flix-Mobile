import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/models/episodes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CurrentlyWatching extends StatelessWidget {
  const CurrentlyWatching({super.key, required this.episodeList});

  final List<Episode> episodeList;

  @override
  Widget build(BuildContext context) {
    int itemCount = (episodeList.length / 3).ceil();
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Currently Watching",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        CarouselSlider.builder(
          itemCount: itemCount,
          itemBuilder: (context, index1, index2) {
            final int first = index1 * 3;
            final int? second = (first < episodeList.length - 1 &&
                    index1 <= (episodeList.length / 3).round())
                ? first + 1
                : null;
            final int? third = (first < episodeList.length - 2 &&
                    index1 <= (episodeList.length / 3).round() - 1)
                ? first + 2
                : null;

            return Row(
              children: [first, second, third]
                  .map(
                    (idx) => Expanded(
                        flex: 1,
                        child: idx != null
                            ? HomeSeriesCard(
                                images: episodeList[idx].series?.images,
                                title: episodeList[idx].title,
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
