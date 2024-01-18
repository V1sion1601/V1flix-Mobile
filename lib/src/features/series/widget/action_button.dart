import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/video/screens/video.dart';
import 'package:app/src/models/source.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.paddingSize, required this.source});

  final double paddingSize;
  final Source source;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingSize, right: paddingSize),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: commonColors["secondColor"],

          minimumSize: const Size.fromHeight(
              40), // fromHeight use double.infinity as width and 40 is the height
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(source: source)));
        },
        icon: const Icon(Icons.play_arrow, color: Colors.white),
        label: const Text(
          'Play',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
