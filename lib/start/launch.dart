import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewPassParameterWidget extends StatefulWidget {
  const ListViewPassParameterWidget({Key? key}) : super(key: key);

  @override
  _ListViewPassParameterWidgetState createState() =>
      _ListViewPassParameterWidgetState();
}

class _ListViewPassParameterWidgetState
    extends State<ListViewPassParameterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: MizzUpTheme.tertiaryColor,
          ),
          child: Stack(
            alignment: const AlignmentDirectional(0, 0.35),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Logotype.svg',
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/FORME2.svg',
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 60,
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                color: MizzUpTheme.secondaryColor,
                              ),
                            ),
              ),
                          
            ],
          ),
        ),
      ),
    );
  }
}
