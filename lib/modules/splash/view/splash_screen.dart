import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters_explorer/helpers/navigator/go_to.dart';
import 'package:rick_and_morty_characters_explorer/helpers/padding/padding.dart';
import 'package:rick_and_morty_characters_explorer/managers/favorites_manager/favorites_manager.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/textstyles_manager.dart';
import 'package:rick_and_morty_characters_explorer/tabbar_widget.dart';

import '../../../gen/assets.gen.dart';
import '../../../managers/cache/cache.dart';
import '../../../managers/cache/cache_key.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      await getFavoritesFromLocalStorage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.foundationMainBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.start.lottie(height: 330.h),
            SizedBox(height: PaddingVertical.thirtyTwo,),
            Text('loading ...', style: TextStylesManager.h3,)
          ],
        ),
      ),
    );
  }

  Future<void> getFavoritesFromLocalStorage() async {
    var favorites = await Cache.instance.retrive(CacheKey.favorites);
    if (favorites.isNotEmpty) {
      await FavoritesManager.instance.initialize();
    }
    GoTo.screenAndRemoveUntil(const TabBarWidget());
  }
}
