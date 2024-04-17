// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddWheelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddWheelScreen(),
      );
    },
    EditWheelRoute.name: (routeData) {
      final args = routeData.argsAs<EditWheelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditWheelScreen(
          key: args.key,
          wheel: args.wheel,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MagicBallGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MagicBallGameScreen(),
      );
    },
    RandomNumberGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RandomNumberGameScreen(),
      );
    },
    WheelGameRoute.name: (routeData) {
      final args = routeData.argsAs<WheelGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WheelGameScreen(
          key: args.key,
          wheel: args.wheel,
        ),
      );
    },
    WheelsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WheelsListScreen(),
      );
    },
    YesOrNoGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YesOrNoGameScreen(),
      );
    },
  };
}

/// generated route for
/// [AddWheelScreen]
class AddWheelRoute extends PageRouteInfo<void> {
  const AddWheelRoute({List<PageRouteInfo>? children})
      : super(
          AddWheelRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddWheelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditWheelScreen]
class EditWheelRoute extends PageRouteInfo<EditWheelRouteArgs> {
  EditWheelRoute({
    Key? key,
    required WheelModel wheel,
    List<PageRouteInfo>? children,
  }) : super(
          EditWheelRoute.name,
          args: EditWheelRouteArgs(
            key: key,
            wheel: wheel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditWheelRoute';

  static const PageInfo<EditWheelRouteArgs> page =
      PageInfo<EditWheelRouteArgs>(name);
}

class EditWheelRouteArgs {
  const EditWheelRouteArgs({
    this.key,
    required this.wheel,
  });

  final Key? key;

  final WheelModel wheel;

  @override
  String toString() {
    return 'EditWheelRouteArgs{key: $key, wheel: $wheel}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MagicBallGameScreen]
class MagicBallGameRoute extends PageRouteInfo<void> {
  const MagicBallGameRoute({List<PageRouteInfo>? children})
      : super(
          MagicBallGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'MagicBallGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RandomNumberGameScreen]
class RandomNumberGameRoute extends PageRouteInfo<void> {
  const RandomNumberGameRoute({List<PageRouteInfo>? children})
      : super(
          RandomNumberGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'RandomNumberGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WheelGameScreen]
class WheelGameRoute extends PageRouteInfo<WheelGameRouteArgs> {
  WheelGameRoute({
    Key? key,
    required WheelModel wheel,
    List<PageRouteInfo>? children,
  }) : super(
          WheelGameRoute.name,
          args: WheelGameRouteArgs(
            key: key,
            wheel: wheel,
          ),
          initialChildren: children,
        );

  static const String name = 'WheelGameRoute';

  static const PageInfo<WheelGameRouteArgs> page =
      PageInfo<WheelGameRouteArgs>(name);
}

class WheelGameRouteArgs {
  const WheelGameRouteArgs({
    this.key,
    required this.wheel,
  });

  final Key? key;

  final WheelModel wheel;

  @override
  String toString() {
    return 'WheelGameRouteArgs{key: $key, wheel: $wheel}';
  }
}

/// generated route for
/// [WheelsListScreen]
class WheelsListRoute extends PageRouteInfo<void> {
  const WheelsListRoute({List<PageRouteInfo>? children})
      : super(
          WheelsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WheelsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YesOrNoGameScreen]
class YesOrNoGameRoute extends PageRouteInfo<void> {
  const YesOrNoGameRoute({List<PageRouteInfo>? children})
      : super(
          YesOrNoGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'YesOrNoGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
