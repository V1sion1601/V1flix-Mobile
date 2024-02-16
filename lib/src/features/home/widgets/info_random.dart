import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/extensions/format_duration.dart';
import 'package:flutter/material.dart';

class InfoRandom extends StatelessWidget {
  const InfoRandom({super.key, required this.series});

  final Series series;

  @override
  Widget build(BuildContext context) {
    String? formatType = series.type == "TV" ? "TV Series" : series.type;
    int listLength = series.genres!.length > 3 ? 3 : series.genres!.length;
    return Container(
      width: double.infinity,
      color: commonColors["bgColor"]?.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                series.title.mainTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: series.genres!.asMap().entries
                  .map(
                    (genres) => Text(
                      "${genres.value.name}${genres.key < listLength - 1 ? ', ' : '' }",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                  .toList().sublist(0, listLength),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${series.avgScore == 0 ? 'Not rated' : series.avgScore}",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  formatType ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(width: 10),
                Text(
                  series.duration!.formatDuration(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton.icon(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SeriesPage(seriesTitle: series.title.mainTitle),
                        ),
                      )
                    },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      commonColors["secondColor"]!),
                ),
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                label: const Text(
                  "PLAY NOW",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
