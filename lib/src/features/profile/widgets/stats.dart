import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class StatsProfile extends StatelessWidget {
  const StatsProfile(
      {super.key,
      required this.meanScore,
      required this.totalEpisodes,
      required this.daysWatched});

  final double meanScore, totalEpisodes, daysWatched;

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
    TextStyle textNumberStyle =  TextStyle(color: commonColors["secondColor"], fontWeight: FontWeight.bold, fontSize: 18);
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              totalEpisodes.toString(),
              style: textNumberStyle,
            ),
            const Text(
              "Total Episodes",
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(width: 20,),
        Column(
          children: [
            Text(
              meanScore.toString(),
              style: textNumberStyle,
            ),
            const Text(
              "Mean Score",
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(width: 20,),
        Column(
          children: [
            Text(
              daysWatched.toString(),
              style: textNumberStyle,
            ),
            const Text(
              "Days Watched",
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
