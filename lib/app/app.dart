import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mobile_challenge/core/router/app_router.dart';
import 'package:mobile_challenge/presentation/style/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppRouter.init();
    return GlobalLoaderOverlay(
      useDefaultLoading: true,
      overlayColor: Colors.black.withOpacity(0.5),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget ?? const SizedBox(),
          );
        },
        scrollBehavior: const CupertinoScrollBehavior(),
        title: '',
        theme: FlutterTheme.light,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}
