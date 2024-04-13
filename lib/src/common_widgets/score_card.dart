import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.avgScore, required this.itemSize, required this.fontSize});

  final double avgScore, itemSize, fontSize;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${avgScore == 0 ? 'Not rated' : avgScore}",
          style:  TextStyle(
              color: Colors.green, fontSize: fontSize, fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 2),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: itemSize,
        ),
      ],
    );
  }
}
