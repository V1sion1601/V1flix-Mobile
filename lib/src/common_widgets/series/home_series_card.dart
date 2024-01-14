import 'package:flutter/material.dart';

//Models
import 'package:app/src/models/series.dart';

//Utils
import 'package:app/src/utils/find_image.dart';

class HomeSeriesCard extends StatelessWidget {
  const HomeSeriesCard({super.key, required this.images, required this.title});

  final List images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: Image.network(
            findImage(images, 'cover'),
          ),
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
