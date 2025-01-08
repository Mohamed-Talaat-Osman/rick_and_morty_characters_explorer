import '../../../../managers/network/api_target.dart';
import '../../constants/characters_endpoints.dart';
import '../../constants/characters_params.dart';
import '../../model/filter_model.dart';

class CharactersListTarget extends APITarget {
  final int? page;
  final FilterModel? filter;

  CharactersListTarget({this.page, this.filter});

  @override
  String get path => CharactersEndpoints.characterList.path;

  @override
  Map<String, dynamic> get queryParameters => {
        CharactersParams.page.key: page,
        CharactersParams.name.key: filter?.name,
        CharactersParams.gender.key: filter?.gender,
        CharactersParams.status.key: filter?.status,
      };
}
