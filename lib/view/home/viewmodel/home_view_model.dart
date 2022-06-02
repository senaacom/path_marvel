import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constant/enum/data_enum.dart';
import '../model/marvel_model.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  CharacterListService characterListService = CharacterListService();

  int _page = 0;

  @observable
  Data status = Data.LOADING;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  List<Results> results = [];

  @observable
  List<Results>? char;

  @observable
  double scrollThreshold = 200.0;
  @observable
  bool hasReachedMax = false;
  @observable
  bool fetching = false;

  @action
  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      if (!hasReachedMax && fetching == true) {
        fetching = false;
        Future.delayed(const Duration(milliseconds: 500), () {
          _page++;
          return getCharacter();
        });
      }
    }
  }

  @action
  Future<List<Results>?> getCharacter() async {
    // status = Data.LOADING;
    char = await characterListService.getCharacterList(page: _page).catchError(
      (e) {
        status = Data.ERROR;
        print(e);
      },
    );
    results += char!;
    hasReachedMax = false;
    fetching = true;
    status = Data.LOADED;
    return results;
  }
}
