import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters_explorer/modules/favorite/controller/favorite_provider.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/empty_data/no_data.dart';

import '../../../helpers/padding/padding.dart';
import '../../../managers/theme/colors_manager.dart';
import '../../../shared_widgets/app_bar/basic_app_bar.dart';
import '../../../shared_widgets/character_card/character_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: ColorsManager.foundationMainSecondary,
        appBar: const BasicAppBar(
          title: 'Favorites',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingHorizontal.eight,
            vertical: PaddingVertical.eight,
          ),
          child: provider.favoritesList.isEmpty
              ? const AppNoData()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: provider.favoritesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CharacterCardWidget(
                      character: provider.favoritesList[index]
                    );
                  },
                ),
        ),
      );
    });
  }
}
