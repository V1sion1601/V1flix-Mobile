import 'package:app/src/constants/colors.dart';
import 'package:app/src/extensions/format_duration.dart';
import 'package:app/src/features/series/widget/info_episode.dart';
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
    super.initState();
    if (widget.episode.description!.length > 50) {
      firstHalf = widget.episode.description!.substring(0, 50);
      secondHalf = widget.episode.description
          !.substring(50, widget.episode.description!.length);
    } else {
      firstHalf = widget.episode.description!;
      secondHalf = "";
    }
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
                            title: widget.episode.title,
                            epNum: widget.episode.epNum)),
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
            ? Text(
                !status ? '$firstHalf...' : '$firstHalf$secondHalf',
                style: const TextStyle(color: Colors.white),
              )
            : Container(),
        const SizedBox(height: 15),
        widget.episode.description != ''
            ? ButtonTheme(
                minWidth: 40,
                child: Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: commonColors["mainColor"],
                    ),
                    onPressed: () => {
                      setState(() {
                        status = !status;
                      })
                    },
                    child: Text(
                      status ? 'See less' : 'See more',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ))
            : Container(),
        const SizedBox(height: 15),
      ],
    );
  }
}
