import 'package:rick_and_morty_characters_explorer/modules/explore/model/filter_model.dart';
import 'package:rick_and_morty_characters_explorer/modules/explore/service/target/characters_list_target.dart';
import '../../../managers/network/api_manager.dart';
import '../model/character_data_model.dart';

class ExploreService {
  // Fetch Characters
  Future<CharacterDataModel?> getCharactersList(
      int? page, FilterModel? filterModel) async {
    final rawResponse = await APIManager.instance
        .request(CharactersListTarget(page: page, filter: filterModel));
    if (rawResponse != null) {
      CharacterDataModel dataModel = CharacterDataModel.fromJson(rawResponse);
      return dataModel;
    }
    return null;
  }
}
