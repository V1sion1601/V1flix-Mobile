import 'package:app/src/models/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({super.key, required this.images});

  final List<SeriesImage> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network(
          findImage(images, "cover"),
        ),
      ),
    );
  }
}
