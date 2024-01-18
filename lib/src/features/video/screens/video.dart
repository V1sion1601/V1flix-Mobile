import 'package:app/src/features/video/widgets/close_button.dart';
import 'package:app/src/models/source.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.source});

  final Source source;

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
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.source.value));
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft],
      customControls: const CustomCloseButton(),

      aspectRatio: 16 / 9,
      // Adjust this according to your video aspect ratio
      // autoPlay: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return Stack(
      children: [Chewie(controller: _chewieController)],
    );
  }
}
