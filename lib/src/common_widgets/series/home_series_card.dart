import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:flutter/material.dart';

//Models
import 'package:app/src/models/series.dart';

//Utils
import 'package:app/src/utils/find_image.dart';

class HomeSeriesCard extends StatelessWidget {
  const HomeSeriesCard(
      {super.key,
      required this.images,
      required this.title,
      required this.index,
      required this.rating});

  final List<SeriesImage>? images;
  final String title;
  final bool rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => SeriesPage(seriesTitle: title)))
      },
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
              child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  findImage(images, "cover"),
                ),
              ),
              if (rating)
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          color: commonColors["secondColor"],
                          child: Text(
                            "#${(index + 1).toString()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )),
                )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
