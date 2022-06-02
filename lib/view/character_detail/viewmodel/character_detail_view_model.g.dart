// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailViewModel on _CharacterDetailViewModelBase, Store {
  late final _$charAtom = Atom(
    name: '_CharacterDetailViewModelBase.char',
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

  late final _$getCharacterDetailAsyncAction = AsyncAction(
    '_CharacterDetailViewModelBase.getCharacterDetail',
  );

  @override
  Future<void> getCharacterDetail(int id) {
    return _$getCharacterDetailAsyncAction
        .run(() => super.getCharacterDetail(id));
  }

  @override
  String toString() {
    return '''
char: ${char}
    ''';
  }
}
