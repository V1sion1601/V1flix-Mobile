import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/screens/list_settings.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  const ListButton(
      {super.key,
      required this.currentUserScore,
      required this.currentUserStatus,
      required this.currentUserEpisode,
      required this.series});

  final int currentUserScore, currentUserEpisode;
  final String currentUserStatus;
  final Series series;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(4),
          ),

          backgroundColor: Colors.grey[700],
          minimumSize: const Size.fromHeight(
              40), // fromHeight use double.infinity as width and 40 is the height
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ListSettings(
                series: series,
                currentUserStatus: currentUserStatus,
                currentUserScore: currentUserScore,
                currentUserEpisode: currentUserEpisode,
              ),
            ),
          );
        },
        icon: const Icon(Icons.list, color: Colors.white),
        label: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
