import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MaterialPageRoute getOverlayMatRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) {
      return getOverlay(widget);
    });
  }

  MaterialPageRoute getMaterialPageRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) {
      return widget;
    });
  }

  Overlay getOverlay(Widget widget) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) {
          return widget;
        }),
      ],
    );
  }
}
