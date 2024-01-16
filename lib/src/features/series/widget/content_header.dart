import 'package:flutter/material.dart';
import 'package:app/src/models/series.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({super.key, required this.series});

  final Series series;
  final double _paddingSize = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: _paddingSize, right: _paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            series.title.mainTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            series.title.altTitle,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "${series.season}",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(width: 10),
              Text(
                "${series.totalEpisodes} eps",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(width: 10),
              Text(
                "${series.view} views",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
