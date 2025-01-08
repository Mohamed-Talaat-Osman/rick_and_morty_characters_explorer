import 'package:flutter/material.dart';

import '../../../managers/favorites_manager/favorites_manager.dart';
import '../../explore/model/character_data_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Results> favoritesList = [];

  bool isFavorite(int id) {
    bool exists = favoritesList.any((element) => element.id == id);
    return exists;
  }

  void onFavoriteTapped(Results object) {
    if (isFavorite(object.id!)) {
      favoritesList.removeWhere((element) => element.id == object.id);
    } else {
      favoritesList.add(object);
    }
    FavoritesManager.instance.setFavorite(favoritesList);
    notifyListeners();
  }
}
