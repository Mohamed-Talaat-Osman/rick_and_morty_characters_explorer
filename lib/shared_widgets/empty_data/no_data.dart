import 'package:rick_and_morty_characters_explorer/helpers/corner_radius/corner_radius.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/textstyles_manager.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../button/button_widget.dart';

class AppNoData extends StatelessWidget {
  const AppNoData({this.onTap, super.key});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.lottie.noData.lottie(height: 200),
          const SizedBox(
            height: 30,
          ),
          Text(
            'empty data !',
            style: TextStylesManager.h3,
          ),
          const SizedBox(
            height: 30,
          ),
          if (onTap != null)
            SizedBox(
              width: 300,
              child: ButtonWidget(
                onPressed: onTap!,
                title: 'try again',
              ),
            ),
        ],
      ),
    );
  }
}
