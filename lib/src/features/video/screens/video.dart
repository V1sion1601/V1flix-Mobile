import 'package:app/src/features/video/widgets/custom_control.dart';
import 'package:app/src/features/video/widgets/title_header.dart';
import 'package:app/src/models/series.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

//Widgets
import 'package:app/src/features/video/widgets/close_button.dart';

//Models
import 'package:app/src/models/source.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen(
      {super.key,
      required this.source,
      required this.title,
      required this.epNum});

  final Source source;
  final String title;
  final int epNum;

  @override
  State<VideoScreen> createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.source.value));
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft],
        aspectRatio: 16 / 8,
        customControls: CustomControls(
          preContext: context,
          epNum: widget.epNum,
          title: widget.title,
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
