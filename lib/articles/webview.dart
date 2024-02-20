// ignore_for_file: unrelated_type_equality_checks, unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import 'package:flutter/gestures.dart';

class WebviewWidget extends StatefulWidget {
  const WebviewWidget({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }


  Future<void> _goBack() async {
    if (await webviewController.canGoBack()) {
      await webviewController.goBack();
    } else {
       Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            WebViewX(
              onWebViewCreated: (controller) => webviewController = controller,
              initialContent: widget.url,
              initialSourceType: SourceType.urlBypass,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              ignoreAllGestures: false,
              initialMediaPlaybackPolicy:
                  AutoMediaPlaybackPolicy.requireUserActionForAllMediaTypes,
              javascriptMode: JavascriptMode.unrestricted,
              webSpecificParams: const WebSpecificParams(
                webAllowFullscreenContent: true,
              ),
              mobileSpecificParams: MobileSpecificParams(
                debuggingEnabled: false,
                gestureNavigationEnabled: true,
                mobileGestureRecognizers: {
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                  Factory<HorizontalDragGestureRecognizer>(
                    () => HorizontalDragGestureRecognizer(),
                  ),
                },
                androidEnableHybridComposition: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 20),
              child: Row(
                children: [
                  MizzUpIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    fillColor: MizzUpTheme.secondaryColor,
                    icon: const Icon(
                                    Icons.arrow_back,
                                    color: MizzUpTheme.tertiaryColor,
                                    size: 20,
                                  ),
                    onPressed: () {
                      // Navigator.pop(context);
                      _goBack();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
