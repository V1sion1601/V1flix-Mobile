import 'package:app/src/models/series.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class VideoTrailer extends StatefulWidget {
  const VideoTrailer({super.key, required this.trailer});

  final Trailer? trailer;

  @override
  State<VideoTrailer> createState() => _VideoTrailerState();
}

class _VideoTrailerState extends State<VideoTrailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.trailer?.idTrailer ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      width: MediaQuery.of(context).size.width,
      controller: _controller,
      onReady: () {},
      liveUIColor: Colors.amber,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
      ],
    );
  }
}
