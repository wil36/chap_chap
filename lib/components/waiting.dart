import 'package:chap_chap/MizzUp_Code/MizzUp_theme.dart';

import 'package:flutter/material.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  _WaitingWidgetState createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0x98FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            decoration: const BoxDecoration(),
            child: const CircularProgressIndicator(
              color: MizzUpTheme.primaryColor,
            ),
          ),
          Text(
            'Veuillez patienter...',
            style: MizzUpTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
