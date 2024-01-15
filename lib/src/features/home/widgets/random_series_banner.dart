import 'package:flutter/material.dart';
//Widgets
import 'package:app/src/features/home/widgets/info_random.dart';
//Models
import 'package:app/src/models/series.dart';
//Utils
import 'package:app/src/utils/find_image.dart';

class RandomSeriesBanner extends StatelessWidget {
  const RandomSeriesBanner({super.key, required this.randomSeries});

  final Series randomSeries;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              findImage(randomSeries.images, "cover"),
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InfoRandom(series: randomSeries)),
          )
        ],
      ),
    );
  }
}
