import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/helpers/padding/padding.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/textstyles_manager.dart';

import '../../helpers/corner_radius/corner_radius.dart';
import '../../managers/theme/colors_manager.dart';
import '../../modules/explore/model/character_data_model.dart';
import '../favorite_button/favorite_button_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  final Results character;


  const CharacterCardWidget(
      {required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.foundationMainBlack,
        borderRadius: BorderRadius.circular(CornerRadius.sixteen),
        image: DecorationImage(image: NetworkImage(character.image ?? "")),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
      alignment : AlignmentDirectional.topEnd,
              child: FavoriteButtonWidget(character: character,)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingHorizontal.sixteen,
              vertical: PaddingVertical.eight,
            ),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: ColorsManager.foundationMainBlack.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(CornerRadius.sixteen),
                bottomRight: Radius.circular(CornerRadius.sixteen),
              ),
            ),
            child: Column(
              children: [
                Text(
                  character.name ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(character.gender ?? ''),
                    Text(character.status ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
