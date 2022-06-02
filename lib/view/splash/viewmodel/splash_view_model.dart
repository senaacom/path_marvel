import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_manager.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  @action
  Future<void> route() async {
    Timer(const Duration(seconds: 1), () => _toCharacterListView());
  }

  void _toCharacterListView() => NavigationManager.instance
      .pushRemove(path: NavConstant.characterListView);
}
