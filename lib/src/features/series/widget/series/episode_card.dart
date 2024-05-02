import 'package:app/src/features/series/widget/series/description.dart';
import 'package:app/src/features/series/widget/series/info_episode.dart';
import 'package:app/src/features/video/screens/video.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/source.dart';
import 'package:app/src/utils/find_image.dart';
import 'package:app/src/utils/find_source.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatefulWidget {
  const EpisodeCard({super.key, required this.episode, required this.duration});

  final Episode episode;
  final int duration;

  @override
  State<EpisodeCard> createState() => _EpisodeCardState();
}

class _EpisodeCardState extends State<EpisodeCard> {
  bool status = false;
  String firstHalf = "", secondHalf = "";

  @override
  void initState() {
    if (widget.episode.description!.length > 50) {
      firstHalf = widget.episode.description!.substring(0, 50);
      secondHalf = widget.episode.description!
          .substring(50, widget.episode.description!.length);
    } else {
      firstHalf = widget.episode.description!;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            SizedBox(
              width: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoScreen(
                        source: handleSource(
                            widget.episode.sources as List<Source>),
                        episode: widget.episode,
                      ),
                    ),
                  );
                },
                child: Image.network(
                  widget.episode.thumbnail == ''
                      ? defaultImage("thumbnail")
                      : widget.episode.thumbnail,
                  fit: BoxFit.fill,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InfoEpisode(episode: widget.episode, duration: widget.duration)
          ],
        ),
        const SizedBox(height: 6),
        widget.episode.description != ''
            ? DescriptionText(
                screenWidth: MediaQuery.of(context).size.width,
                paddingSize: 0,
                line: 1,
                description: widget.episode.description ?? "",
              )
            : Container(),
        const SizedBox(height: 15),
      ],
    );
  }
}
