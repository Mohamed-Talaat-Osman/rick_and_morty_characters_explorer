import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters_explorer/helpers/padding/padding.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';

import '../../managers/theme/textstyles_manager.dart';

// ignore: must_be_immutable
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final void Function()? onFilterTap;
  final TextEditingController? searchController;
  const SearchAppBar({
    this.searchController,
    this.onChange,
    this.onSubmitted,
    this.onFilterTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: PaddingVertical.fourty,
          bottom: PaddingVertical.eight,
          right: PaddingHorizontal.eight,
          left: PaddingHorizontal.eight,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.foundationMainBlack,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: SearchBar(
              controller : searchController,
              onChanged: onChange,
              onSubmitted: onSubmitted,
              hintText : 'search by name',
              backgroundColor: WidgetStatePropertyAll<Color>(
                ColorsManager.foundationMainSecondary,
              ),
              leading: const Icon(Icons.search),
              padding: WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(
                  horizontal: PaddingHorizontal.sixteen,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onFilterTap,
              child: Icon(
                  Icons.filter_alt,
                color: ColorsManager.foundationMainWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height+10);
}
