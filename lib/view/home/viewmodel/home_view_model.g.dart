// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$statusAtom = Atom(
    name: '_HomeViewModelBase.status',
  );

  @override
  Data get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Data value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$scrollControllerAtom = Atom(
    name: '_HomeViewModelBase.scrollController',
  );

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$resultsAtom = Atom(
    name: '_HomeViewModelBase.results',
  );

  @override
  List<Results> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<Results> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$charAtom = Atom(
    name: '_HomeViewModelBase.char',
  );

  @override
  List<Results>? get char {
    _$charAtom.reportRead();
    return super.char;
  }

  @override
  set char(List<Results>? value) {
    _$charAtom.reportWrite(value, super.char, () {
      super.char = value;
    });
  }

  late final _$scrollThresholdAtom = Atom(
    name: '_HomeViewModelBase.scrollThreshold',
  );

  @override
  double get scrollThreshold {
    _$scrollThresholdAtom.reportRead();
    return super.scrollThreshold;
  }

  @override
  set scrollThreshold(double value) {
    _$scrollThresholdAtom.reportWrite(value, super.scrollThreshold, () {
      super.scrollThreshold = value;
    });
  }

  late final _$hasReachedMaxAtom = Atom(
    name: '_HomeViewModelBase.hasReachedMax',
  );

  @override
  bool get hasReachedMax {
    _$hasReachedMaxAtom.reportRead();
    return super.hasReachedMax;
  }

  @override
  set hasReachedMax(bool value) {
    _$hasReachedMaxAtom.reportWrite(value, super.hasReachedMax, () {
      super.hasReachedMax = value;
    });
  }

  late final _$fetchingAtom = Atom(
    name: '_HomeViewModelBase.fetching',
  );

  @override
  bool get fetching {
    _$fetchingAtom.reportRead();
    return super.fetching;
  }

  @override
  set fetching(bool value) {
    _$fetchingAtom.reportWrite(value, super.fetching, () {
      super.fetching = value;
    });
  }

  late final _$getCharacterAsyncAction = AsyncAction(
    '_HomeViewModelBase.getCharacter',
  );

  @override
  Future<List<Results>?> getCharacter() {
    return _$getCharacterAsyncAction.run(() => super.getCharacter());
  }

  late final _$_HomeViewModelBaseActionController = ActionController(
    name: '_HomeViewModelBase',
  );

  @override
  void onScroll() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.onScroll');
    try {
      return super.onScroll();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
scrollController: ${scrollController},
results: ${results},
char: ${char},
scrollThreshold: ${scrollThreshold},
hasReachedMax: ${hasReachedMax},
fetching: ${fetching}
    ''';
  }
}
