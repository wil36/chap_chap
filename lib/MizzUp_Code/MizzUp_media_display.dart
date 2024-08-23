// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Widget;
import 'package:mime_type/mime_type.dart' show mime;

const _kSupportedVideoMimes = {'video/mp4', 'video/mpeg'};

bool _isVideoPath(String path) =>
    _kSupportedVideoMimes.contains(mime(path.split('?').first));

class MizzUpMediaPlayer extends StatelessWidget {
  const MizzUpMediaPlayer({
    Key? key,
    required this.path,
    required this.imageBuilder,
    required this.videoPlayerBuilder,
    this.width,
    this.height,
  }) : super(key: key);

  final String? path;
  final Widget Function(String?) imageBuilder;
  final Widget Function(String?) videoPlayerBuilder;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) =>
      _isVideoPath(path!) ? videoPlayerBuilder(path) : imageBuilder(path);
}
