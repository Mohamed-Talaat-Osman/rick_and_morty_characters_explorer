
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/character_details/controller/character_details_provider.dart';
import '../../modules/explore/controller/explore_provider.dart';
import '../../modules/favorite/controller/favorite_provider.dart';


List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ExploreProvider>(create: (context) => ExploreProvider()),
  ChangeNotifierProvider<FavoriteProvider>(create: (context) => FavoriteProvider()),
  ChangeNotifierProvider<CharacterDetailsProvider>(create: (context) => CharacterDetailsProvider()),
];
