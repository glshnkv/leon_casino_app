import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:leon_casino_app/screens/home/home_screen.dart';
import 'package:leon_casino_app/screens/magic_ball/magic_ball_game_screen.dart';
import 'package:leon_casino_app/screens/random_number/random_number_game_screen.dart';
import 'package:leon_casino_app/screens/wheel/add_wheel/add_wheel_screen.dart';
import 'package:leon_casino_app/screens/wheel/edit_wheel/edit_wheel_screen.dart';
import 'package:leon_casino_app/screens/wheel/wheel_game/wheel_game_screen.dart';
import 'package:leon_casino_app/screens/wheel/wheels_list/wheels_list_screen.dart';
import 'package:leon_casino_app/screens/yes_or_no/yes_or_no_game_screen.dart';
import 'package:leon_casino_app/models/wheel_model.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: WheelsListRoute.page),
    AutoRoute(page: AddWheelRoute.page),
    AutoRoute(page: EditWheelRoute.page),
    AutoRoute(page: WheelGameRoute.page),
    AutoRoute(page: RandomNumberGameRoute.page),
    AutoRoute(page: MagicBallGameRoute.page),
    AutoRoute(page: YesOrNoGameRoute.page),
  ];
}