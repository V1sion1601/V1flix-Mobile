import 'package:app/src/constants/colors.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:flutter/material.dart';

class UserSeriesDetails extends StatelessWidget {
  const UserSeriesDetails(
      {super.key,
      required this.currentUserScore,
      required this.currentUserStatus});

  final int currentUserScore;
  final String currentUserStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Container(
                padding:
                    const EdgeInsets.only(top: 3, bottom: 3, left: 7, right: 7),
                color: commonColors["secondColor"],
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      currentUserScore.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 7, right: 7),
              color: currentUserStatus == 'completed'
                  ? Colors.green
                  : currentUserStatus == 'plans to watch'
                      ? Colors.grey
                      : currentUserStatus == "on-hold"
                          ? Colors.yellow
                          : Colors.green[300],
              child: Text(
                currentUserStatus.capitalize(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
