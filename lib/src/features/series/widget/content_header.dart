import 'package:app/src/common_widgets/score_card.dart';
import 'package:flutter/material.dart';
import 'package:app/src/models/series.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({super.key, required this.series});

  final Series series;
  final double _paddingSize = 8, _itemSize = 18;

  @override
  Widget build(BuildContext context) {
    String? formatType = series.type == "TV" ? "TV Series" : series.type;
    String genres = series.genres!
        .asMap()
        .entries
        .map((genres) => genres.value.name)
        .join(", ");
    return Padding(
      padding: EdgeInsets.only(left: _paddingSize, right: _paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(formatType ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          const SizedBox(height: 2),
          Text(
            series.title.mainTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(height: 5),
          Text(
            series.title.altTitle ?? "",
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5),
          Text(
            "Genres: $genres",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              ScoreCard(avgScore: series.avgScore ?? 0, itemSize: _itemSize,),
              const SizedBox(width: 10),
              Text(
                "${series.season}",
                style: TextStyle(color: Colors.white, fontSize: _itemSize),
              ),
              const SizedBox(width: 10),
              Text(
                "${series.totalEpisodes} eps",
                style: TextStyle(color: Colors.white, fontSize: _itemSize),
              ),
              const SizedBox(width: 10),
              Text(
                "${series.view} views",
                style: TextStyle(color: Colors.white, fontSize: _itemSize),
              )
            ],
          )
        ],
      ),
    );
  }
}
