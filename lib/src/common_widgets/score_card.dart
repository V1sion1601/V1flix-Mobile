import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.avgScore, required this.itemSize});

  final double avgScore, itemSize;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${avgScore == 0 ? 'Not rated' : avgScore}",
          style: const TextStyle(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w700),
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
