import 'package:app/src/common_widgets/score_card.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:flutter/material.dart';

class DetailListHeader extends StatelessWidget {
  const DetailListHeader(
      {super.key,
      required this.images,
      required this.title,
      required this.currentUserStatus,
      required this.currentUserScore});

  final int currentUserScore;
  final String currentUserStatus;
  final SeriesTitle title;
  final List<SeriesImage>? images;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            findImage(images, "thumbnail"),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 30 / 100 - 30,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 70 / 100 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.mainTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(height: 8,),
              Text(
                title.altTitle ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: currentUserStatus == 'completed'
                          ? Colors.green
                          : currentUserStatus == 'plans to watch'
                          ? Colors.grey
                          : currentUserStatus == "on-hold"
                          ? Colors.yellow
                          : Colors.green[300],
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        currentUserStatus.capitalize(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  ScoreCard(
                    avgScore: currentUserScore * 1.0,
                    itemSize: 15,
                    fontSize: 25,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
