import 'package:app/src/features/home/widgets/history_episode.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.images,
      required this.title,
      required this.epNum});

  final List<SeriesImage>? images;
  final String title;
  final String epNum;

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
          Stack(
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    findImage(images, "cover"),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: HistoryEpisode(epNum: epNum, title: title,),
                ),
              )
            ],
          ),
          const SizedBox(height: 10, width: 10,)
        ],
      ),
    );
  }
}
