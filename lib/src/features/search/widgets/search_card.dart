import 'package:app/src/extensions/format_string.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';
import '../../../models/series.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.images, required this.title, required this.width});

  final List<SeriesImage>? images;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    String formatTitle = title.truncate(line: 1, screenWidth: width);
    return Column(mainAxisSize: MainAxisSize.min, children: [
      InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => SeriesPage(seriesTitle: title)))
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            findImage(images, "cover"),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        formatTitle,
        style: const TextStyle(color: Colors.white),
      )
    ]);
  }
}
