// ignore_for_file: file_names

import 'package:chewie/chewie.dart' show Chewie, ChewieController;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

const kDefaultAspectRatio = 16 / 9;

enum VideoType {
  asset,
  network,
}

class MizzUpVideoPlayer extends StatefulWidget {
  const MizzUpVideoPlayer({
    Key? key,
    required this.path,
    this.videoType = VideoType.network,
    this.width,
    this.height,
    this.aspectRatio,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = true,
    this.allowFullScreen = true,
    this.allowPlaybackSpeedMenu = false,
  }) : super(key: key);

  final String path;
  final VideoType videoType;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlaybackSpeedMenu;

  @override
  State<StatefulWidget> createState() => _MizzUpVideoPlayerState();
}

class _MizzUpVideoPlayerState extends State<MizzUpVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  double? get width => widget.width == null || widget.width! >= double.infinity
      ? MediaQuery.of(context).size.width
      : widget.width;

  double? get height =>
      widget.height == null || widget.height! >= double.infinity
          ? (width != null ? width! / aspectRatio : null)
          : widget.height;

  double get aspectRatio =>
      _chewieController?.videoPlayerController.value.aspectRatio ??
      kDefaultAspectRatio;

  Future initializePlayer() async {
    _videoPlayerController = widget.videoType == VideoType.network
        ? VideoPlayerController.networkUrl(Uri.parse(widget.path))
        : VideoPlayerController.asset(widget.path);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      aspectRatio: widget.aspectRatio,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      showControls: widget.showControls,
      allowFullScreen: widget.allowFullScreen,
      allowPlaybackSpeedChanging: widget.allowPlaybackSpeedMenu,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: height,
          width: width,
          child: _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: _chewieController!)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Chargemenet'),
                  ],
                ),
        ),
      );
}
