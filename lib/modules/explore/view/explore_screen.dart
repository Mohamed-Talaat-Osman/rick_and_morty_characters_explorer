import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters_explorer/helpers/padding/padding.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';
import 'package:rick_and_morty_characters_explorer/modules/explore/controller/explore_provider.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/app_bar/search_app_bar.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/empty_data/no_data.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/once_future_builder/once_future_builder.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/shimmer/shimmer_helper.dart';

import '../../../managers/theme/textstyles_manager.dart';
import '../../../shared_widgets/character_card/character_card_widget.dart';
import 'componanets/filter_bottom_sheet.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: ColorsManager.foundationMainSecondary,
        appBar: SearchAppBar(
          searchController: provider.searchController,
          onChange: (v) {
            if (v.isNotEmpty) {
              provider.nameFilter = v;
              provider.applyFilter();
            }
          },
          onSubmitted: (v) {
            if (v.isNotEmpty) {
              provider.nameFilter = v;
              provider.applyFilter();
            }
          },
          onFilterTap: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: ColorsManager.foundationMainBlack,
              builder: (BuildContext context) {
                return const FilterBottomSheet();
              },
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingHorizontal.eight,
            vertical: PaddingVertical.eight,
          ),
          child: OnceFutureBuilder(
            future: () async {
              provider.initExplore();
            },
            builder: (context, snapshot) {
              if (provider.isExploreLoading) {
                return ShimmerHelper().buildGridShimmer();
              }
              if (provider.charactersList.isEmpty) {
                return AppNoData(
                  onTap: () => provider.fetchCharacters(),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  provider.fetchCharacters();
                },
                notificationPredicate: (scrollInfo) {
                  if (scrollInfo is ScrollEndNotification &&
                      scrollInfo.metrics.extentAfter == 0 &&
                      provider.hasNextPage) {
                    provider.loadMoreCharacters();
                  }
                  return true;
                },
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: provider.charactersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CharacterCardWidget(
                            character: provider.charactersList[index],
                          );
                        },
                      ),
                    ),
                    if (provider.isLoadMore)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: PaddingVertical.thirtyTwo,
                        ),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
