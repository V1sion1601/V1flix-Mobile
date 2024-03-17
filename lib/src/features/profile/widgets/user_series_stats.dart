import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class UserSeriesStats extends StatelessWidget {
  const UserSeriesStats(
      {super.key, required this.rating, required this.currentEpisode, required this.totalEpisode});

  final int rating, currentEpisode, totalEpisode;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("$rating", style: textStyle,),
            Icon(Icons.star, color: commonColors["secondColor"],)
          ],
        ),
        Text("$currentEpisode/$totalEpisode", style: textStyle,),
      ],
    );
  }
}