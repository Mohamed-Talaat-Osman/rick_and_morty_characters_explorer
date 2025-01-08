import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';
import 'package:rick_and_morty_characters_explorer/modules/favorite/controller/favorite_provider.dart';

import '../../helpers/corner_radius/corner_radius.dart';
import '../../helpers/padding/padding.dart';
import '../../modules/explore/model/character_data_model.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final Results character;

  const FavoriteButtonWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, provider, child) {
      return Container(
        margin: EdgeInsets.all(
          PaddingHorizontal.eight,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.foundationMainBlack.withOpacity(0.6),
          borderRadius: BorderRadius.circular(CornerRadius.sixteen),
        ),
        child: IconButton(
          onPressed: () {
            provider.onFavoriteTapped(character);
          },
          icon: provider.isFavorite(character.id!)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: ColorsManager.foundationMainPrimary,
        ),
      );
    });
  }
}
