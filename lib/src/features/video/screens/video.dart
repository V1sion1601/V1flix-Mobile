import 'package:app/src/features/video/services/video.dart';
import 'package:app/src/features/video/widgets/custom_control.dart';
import 'package:app/src/features/video/widgets/title_header.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/utils/check_version.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

//Widgets
import 'package:app/src/features/video/widgets/close_button.dart';

//Models
import 'package:app/src/models/source.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.source, required this.episode});

  final Source source;

  // final String title, seriesId, episodeId;
  // final int epNum;
  final Episode episode;

  @override
  State<VideoScreen> createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final VideoService _videoService = VideoService();

  void _load() async {
    if (GlobalUserData().loggedUser.username != "") {
      await _videoService.addView(
          seriesId: widget.episode.series!.id, episodeId: widget.episode.id);

      Episode? existedSeries = GlobalUserData().currentlyWatching.firstWhere(
          (episode) => episode.series?.id == episode.series?.id,
          orElse: () => Episode(id: "", title: "", epNum: 1));
      if (existedSeries.id != "") {
        GlobalUserData().currentlyWatching.remove(existedSeries);
      }
      GlobalUserData().currentlyWatching.insert(0, widget.episode);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
    _load();
  }

  @override
  void initState() {
    _controller =
        checkVersion() ? VideoPlayerController.networkUrl(Uri.parse(widget.source.value)) :
        VideoPlayerController.asset("assets/test.mp4");
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft],
        aspectRatio: 16 / 8,
        customControls: CustomControls(
          preContext: context,
          subtitles: widget.episode.subtitles ?? [],
          epNum: widget.episode.epNum,
          title: widget.episode.title,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return Chewie(controller: _chewieController);
  }
}
