import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePreview extends StatefulWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  State<ProfilePreview> createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('hello'));
  }
}
