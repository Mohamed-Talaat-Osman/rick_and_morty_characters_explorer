import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters_explorer/helpers/navigator/go_to.dart';

import '../../modules/explore/model/character_data_model.dart';
import '../../modules/favorite/controller/favorite_provider.dart';
import '../cache/cache.dart';
import '../cache/cache_key.dart';

class FavoritesManager {
  // Private constructor
  FavoritesManager._privateConstructor();

  // Static final instance
  static final FavoritesManager _instance =
      FavoritesManager._privateConstructor();

  // Static method
  static FavoritesManager get instance {
    return _instance;
  }

  late List<Results> _favoritesList;

  Future<void> initialize() async {
    var favoritesData = await Cache.instance.retrive(CacheKey.favorites);
    List<dynamic> jsonList = jsonDecode(favoritesData);
    _favoritesList = jsonList.map((json) => Results.fromJson(json)).toList();
    Provider.of<FavoriteProvider>(GoTo.navigationKey.currentContext!,
            listen: false)
        .favoritesList = _favoritesList;
  }

  Future<void> setFavorite(List<Results> favoritesList) async {
    String jsonString =
        jsonEncode(favoritesList.map((obj) => obj.toJson()).toList());
    await Cache.instance.store(jsonString, CacheKey.favorites);
  }

  Future<void> destroy() async {
    await Cache.instance.delete(CacheKey.favorites);
    _favoritesList = [];
  }
}
