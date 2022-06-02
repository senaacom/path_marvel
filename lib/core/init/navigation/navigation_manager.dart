import 'package:flutter/material.dart';

class NavigationManager {
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool _removeAll(Route<dynamic> route) => false;

  Future<void> push({String? path, Object? object}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: object);
  }

  Future<void> pushRemove({String? path, Object? object}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, _removeAll, arguments: object);
  }
}
