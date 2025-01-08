import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/managers/snack_bar/snack_bar_manager.dart';
import 'package:rick_and_morty_characters_explorer/modules/explore/model/filter_model.dart';
import 'package:rick_and_morty_characters_explorer/modules/explore/service/explore_service.dart';

import '../model/character_data_model.dart';

class ExploreProvider extends ChangeNotifier {
  List<Results> charactersList = [];
  bool isExploreLoading = false;
  bool isLoadMore = false;
  bool hasNextPage = false;
  int pageNumber = 1;
  String? nameFilter;
  String? selectedGender;
  String? selectedStatus;
  FilterModel? filterModel;
  TextEditingController searchController = TextEditingController();

  void initExplore(){
    if(charactersList.isEmpty){
      fetchCharacters();
    }
  }

  Future<void> fetchCharacters() async {
    isExploreLoading = true;
    notifyListeners();
    pageNumber = 1;
    final response =
        await ExploreService().getCharactersList(pageNumber, filterModel);
    if (response != null) {
      charactersList = response.results ?? [];
      hasNextPage = response.info?.next != null;
    }else{
      SnackBarManager.showErrorMessage('something went wrong!');
    }
    isExploreLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreCharacters() async {
    isLoadMore = true;
    notifyListeners();
    pageNumber ++;
    final response =
    await ExploreService().getCharactersList(pageNumber, filterModel);
    if (response != null) {
      charactersList.addAll(response.results ?? []);
      hasNextPage = response.info?.next != null;
    }else{
      SnackBarManager.showErrorMessage('something went wrong!');
    }
    isLoadMore = false;
    notifyListeners();
  }

  void applyFilter(){
    filterModel = FilterModel(nameFilter, selectedGender, selectedStatus);
    fetchCharacters();
  }

  void clearFilter(){
    selectedStatus = null;
    selectedGender = null;
    applyFilter();
  }

  void selectStatus(value){
    selectedStatus = value;
    notifyListeners();
  }

  void selectGender(value){
    selectedGender = value;
    notifyListeners();
  }
}
