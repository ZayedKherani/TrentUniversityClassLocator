import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:trent_u_class_find/pages/home.dart';
import 'package:trent_u_class_find/services/theme_mode_notifier_service/theme_mode_notifier_service.dart';
import 'package:trent_u_class_find/universals/theme.dart';
import 'package:trent_u_class_find/universals/variables.dart';

void main() {
  WidgetsBinding? widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  runApp(
    ChangeNotifierProvider<ThemeModeNotifierService>(
      create: (
        BuildContext? context,
      ) =>
          ThemeModeNotifierService(),
      child: const TrentClassFindApp(),
    ),
  );
}

class TrentClassFindApp extends StatefulWidget {
  const TrentClassFindApp({
    super.key,
  });

  @override
  State<TrentClassFindApp> createState() => _TrentClassFindAppState();
}

class _TrentClassFindAppState extends State<TrentClassFindApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(
    BuildContext? context,
  ) {
    return Consumer<ThemeModeNotifierService>(
      builder: (
        BuildContext? context,
        ThemeModeNotifierService? theme,
        Widget? child,
      ) {
        globalThemeModeNotifier = theme;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: 'Trent Class Find',
          theme: lightTheme!,
          darkTheme: darkTheme!,
          themeMode: theme!.getThemeMode(),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.trackpad,
            },
          ),
          initialRoute: '/',
          routes: {
            '/': (
              BuildContext? context,
            ) =>
                const TrentClassFindHome(),
          },
        );
      },
    );
  }
}
