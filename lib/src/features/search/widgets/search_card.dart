import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';
import '../../../models/series.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.images, required this.title});

  final List<SeriesImage>? images;
  final String title;

  @override
  Widget build(BuildContext context) {
    String formatTitle =
        title.length > 10 ? "${title.substring(0, 9)}..." : title;
    return Column(children: [
      InkWell(
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => SeriesPage(seriesTitle: title)))
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            findImage(images, "cover"),
          ),
        ),
      ),
      Text(
        formatTitle,
        style: const TextStyle(color: Colors.white),
      )
    ]);
  }
}
