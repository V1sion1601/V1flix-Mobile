import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/common_widgets/score_card.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class RelationCard extends StatelessWidget {
  const RelationCard({super.key, required this.relation});

  final Relation relation;

  @override
  Widget build(BuildContext context) {
    TextStyle detailSeries = const TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    return Row(
      children: [
        SizedBox(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeriesPage(
                          seriesTitle: relation.series!.title.mainTitle)));
            },
            child: Image.network(
              findImage(relation.series?.images, "thumbnail"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                relation.role ?? "",
                style: TextStyle(
                  color: commonColors["secondColor"],
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                relation.series?.title.mainTitle ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    relation.series?.season ?? "",
                    style: detailSeries,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${relation.series?.totalEpisodes ?? 0} eps",
                    style: detailSeries,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    relation.series?.status ?? "",
                    style: detailSeries,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ScoreCard(avgScore: relation.series?.avgScore ?? 0, itemSize: 10,)
            ],
          ),
        )
      ],
    );
  }
}
