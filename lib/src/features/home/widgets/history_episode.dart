import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HistoryEpisode extends StatelessWidget {
  const HistoryEpisode({super.key, required this.epNum, required this.title});

  final String epNum, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      color: commonColors["bgColor"]?.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Ep: $epNum",
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 15  ,),
            )
          ],
        ),
      ),
    );
  }
}
