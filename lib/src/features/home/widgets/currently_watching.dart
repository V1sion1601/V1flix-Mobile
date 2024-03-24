import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/features/home/widgets/history_card.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/utils/find_source.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CurrentlyWatching extends StatelessWidget {
  const CurrentlyWatching({super.key, required this.episodeList});

  final List<Episode> episodeList;

  @override
  Widget build(BuildContext context) {
    int itemCount = (episodeList.length / 3).ceil();
    return CarouselSlider.builder(
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
                    flex: 3,
                    child: idx != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: HistoryCard(
                              episode: episodeList[idx],
                              source: handleSource(episodeList[idx].sources),
                            ),
                          )
                        : Container()),
              )
              .toList(),
        );
      },
      options: CarouselOptions(
        aspectRatio: 2,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
    );
  }
}
