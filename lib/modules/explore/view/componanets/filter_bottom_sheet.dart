import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters_explorer/helpers/navigator/go_to.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';
import 'package:rick_and_morty_characters_explorer/modules/explore/controller/explore_provider.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/button/button_widget.dart';

import '../../../../helpers/padding/padding.dart';
import '../../../../managers/theme/textstyles_manager.dart';
import '../../../../shared_widgets/button/entities/button_widget_type.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreProvider>(
      builder: (context,provider,child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingHorizontal.sixteen,
            vertical: PaddingVertical.sixteen,
          ),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter',
                style: TextStylesManager.h3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('status',style : TextStylesManager.p2,),
                  DropdownButton(
                    hint : Text('select status',style : TextStylesManager.p2,),
                    dropdownColor: ColorsManager.foundationMainSecondary,
                    value: provider.selectedStatus,
                    items: const [
                      DropdownMenuItem(
                        value: 'alive',
                        child: Text('alive'),
                      ),
                      DropdownMenuItem(
                        value: 'dead',
                        child: Text('dead'),
                      ),
                      DropdownMenuItem(
                        value: 'unknown',
                        child: Text('unknown'),
                      ),
                    ],
                    onChanged: (v) {
                      provider.selectStatus(v);
                    },
                  ),
                ],
              ),
              SizedBox(height: PaddingVertical.eight,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('gender',style : TextStylesManager.p2,),
                  DropdownButton(
                    hint : Text('select gender',style : TextStylesManager.p2,),
                    dropdownColor: ColorsManager.foundationMainSecondary,
                    value: provider.selectedGender,
                    items: const [
                      DropdownMenuItem(
                        value: 'male',
                        child: Text('male'),
                      ),
                      DropdownMenuItem(
                        value: 'female',
                        child: Text('female'),
                      ),
                      DropdownMenuItem(
                        value: 'genderless',
                        child: Text('genderless'),
                      ),
                      DropdownMenuItem(
                        value: 'unknown',
                        child: Text('unknown'),
                      ),
                    ],
                    onChanged: (v) {
                      provider.selectGender(v);
                    },
                  ),
                ],
              ),
              SizedBox(height: PaddingVertical.eight,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ButtonWidget(
                      title: 'apply filter',
                      onPressed: () {
                        GoTo.goBack();
                        provider.applyFilter();
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonWidget(
                      title: 'clear',
                      type: ButtonWidgetType.secondary,
                      onPressed: () {
                        GoTo.goBack();
                        provider.clearFilter();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
