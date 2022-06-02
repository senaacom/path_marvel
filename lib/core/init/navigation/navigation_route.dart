import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../view/character_detail/view/character_detail_view.dart';
import '../../../view/home/model/marvel_model.dart';
import '../../../view/home/view/home_view.dart';
import '../../component/scaffold/no_network.dart';
import '../../component/scaffold/not_found_scaffold.dart';
import '../../constant/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavConstant.characterListView:
        return defaultNavigate(const HomeView());

      case NavConstant.characterDetailView:
        return defaultNavigate(
          CharacterDetailView(character: args.arguments as Results),
        );

      //*       NO NETWORK      //
      case NavConstant.noNetwork:
        return defaultNavigate(const NoNetworkScaffold());

      //*       NOT FOUND      //
      default:
        return defaultNavigate(const NotFoundScaffold());
    }
  }

  PageRoute defaultNavigate(Widget widget) => Platform.isAndroid
      ? MaterialPageRoute(builder: (context) => widget)
      : CupertinoPageRoute(builder: (context) => widget);
}
