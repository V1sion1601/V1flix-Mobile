import 'package:app/src/constants/colors.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/utils/format_duration.dart';
import 'package:flutter/material.dart';

class InfoRandom extends StatelessWidget {
  const InfoRandom({super.key, required this.series});

  final Series series;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: commonColors["bgColor"]?.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              series.title.mainTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              series.duration!.formatDuration(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton.icon(
                onPressed: () => {},
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
