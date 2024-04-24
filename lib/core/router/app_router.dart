//@formatter:off
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_challenge/core/services/injection_container.dart';

import 'package:mobile_challenge/presentation/screen/home_feed_screen/home_feed_screen.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/photos_bloc/photos_bloc.dart';
import 'package:mobile_challenge/presentation/screen/splash_screen/splash_screen.dart';
//{imports end}

class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _homeScreen = '/home';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;
  static String get homeScreen => _homeScreen;
  //{getters end}

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        GoRoute(
          path: _splashScreen,
          name: 'SplashScreen',
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: _homeScreen,
          name: 'HomeScreen',
          builder: (context, state) => BlocProvider(
            create: (context) => sl<PhotosBloc>()..add(const LoadPhotosEvent()),
            child: HomeFeedScreen(),
          ),
        ),
        //{routes end}
      ],
    );
  }
}
