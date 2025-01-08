import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters_explorer/helpers/padding/padding.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';

import '../../managers/theme/textstyles_manager.dart';

// ignore: must_be_immutable
class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BasicAppBar({
     required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.foundationMainBlack,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
