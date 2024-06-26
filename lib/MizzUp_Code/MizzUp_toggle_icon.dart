// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({
    Key? key,
    required this.value,
    required this.onPressed,
    required this.onIcon,
    required this.offIcon,
  }) : super(key: key);

  final bool? value;
  final Function() onPressed;
  final Widget onIcon;
  final Widget offIcon;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: value! ? onIcon : offIcon,
      );
}
