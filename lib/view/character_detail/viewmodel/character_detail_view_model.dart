import 'package:mobx/mobx.dart';

import '../../home/model/marvel_model.dart';
import '../service/character_detail_service.dart';

part 'character_detail_view_model.g.dart';

class CharacterDetailViewModel = _CharacterDetailViewModelBase
    with _$CharacterDetailViewModel;

abstract class _CharacterDetailViewModelBase with Store {
  CharacterDetailService characterDetailService = CharacterDetailService();

  @observable
  List<Results>? char;

  @action
  Future<void> getCharacterDetail(int id) async {
    char = await characterDetailService.getCharacterDetail(id).catchError(
      (e) {
        print(e);
      },
    );
  }
}
