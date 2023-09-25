import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trent_u_class_find/pages/settings/package_page.dart';

import 'package:trent_u_class_find/universals/arguments.dart';
import 'package:trent_u_class_find/pages/buildings/center.dart';
import 'package:trent_u_class_find/pages/buildings/floor.dart';
import 'package:trent_u_class_find/pages/buildings/room.dart';
import 'package:trent_u_class_find/pages/home.dart';
import 'package:trent_u_class_find/pages/settings/license_page.dart';
import 'package:trent_u_class_find/pages/settings/settings.dart';
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
            '/settings': (
              BuildContext? context,
            ) =>
                const TrentAppSettingsPage(),
          },
          onGenerateRoute: (
            RouteSettings? settings,
          ) {
            if (settings!.name == '/center') {
              final TrentCenterArguments args =
                  settings.arguments as TrentCenterArguments;

              return PageTransition(
                child: MediaQuery.of(
                          context!,
                        ).size.width >
                        600
                    ? Center(
                        child: SizedBox(
                          width: 550.0,
                          child: TrentCenter(
                            centerIndex: args.centerIndex,
                          ),
                        ),
                      )
                    : TrentCenter(
                        centerIndex: args.centerIndex,
                      ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/floor') {
              final TrentFloorArguments args =
                  settings.arguments as TrentFloorArguments;

              return PageTransition(
                child: MediaQuery.of(
                          context!,
                        ).size.width >
                        600
                    ? Center(
                        child: SizedBox(
                          width: 550.0,
                          child: TrentFloor(
                            centerIndex: args.centerIndex,
                            floorIndex: args.floorIndex,
                          ),
                        ),
                      )
                    : TrentFloor(
                        centerIndex: args.centerIndex,
                        floorIndex: args.floorIndex,
                      ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/room') {
              final TrentRoomArguments args =
                  settings.arguments as TrentRoomArguments;

              return PageTransition(
                child: MediaQuery.of(
                          context!,
                        ).size.width >
                        600
                    ? Center(
                        child: SizedBox(
                          width: 550.0,
                          child: TrentRoom(
                            centerIndex: args.centerIndex,
                            floorIndex: args.floorIndex,
                            roomIndex: args.roomIndex,
                          ),
                        ),
                      )
                    : TrentRoom(
                        centerIndex: args.centerIndex,
                        floorIndex: args.floorIndex,
                        roomIndex: args.roomIndex,
                      ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/settings/licenses') {
              final TrentAppSettingsLicensePageArguments args =
                  settings.arguments as TrentAppSettingsLicensePageArguments;

              return PageTransition(
                child: MediaQuery.of(
                          context!,
                        ).size.width >
                        600
                    ? Center(
                        child: SizedBox(
                          width: 550.0,
                          child: TrentAppSettingsLicensePage(
                            applicationVersion: args.applicationVersion,
                            applicationName: args.applicationName,
                            applicationLegalese: args.applicationLegalese,
                            applicationIconAssetPath:
                                args.applicationIconAssetPath,
                          ),
                        ),
                      )
                    : TrentAppSettingsLicensePage(
                        applicationVersion: args.applicationVersion,
                        applicationName: args.applicationName,
                        applicationLegalese: args.applicationLegalese,
                        applicationIconAssetPath: args.applicationIconAssetPath,
                      ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/settings/licenses/package') {
              final TrentAppSettingsLicensePackagePageArguments args = settings
                  .arguments as TrentAppSettingsLicensePackagePageArguments;

              return PageTransition(
                child: MediaQuery.of(
                          context!,
                        ).size.width >
                        600
                    ? Center(
                        child: SizedBox(
                          width: 550.0,
                          child: PackagePage(
                            packageName: args.packageName,
                            packageOccorrences: args.packageOccorrences,
                            paragraphs: args.paragraphs,
                          ),
                        ),
                      )
                    : PackagePage(
                        packageName: args.packageName,
                        packageOccorrences: args.packageOccorrences,
                        paragraphs: args.paragraphs,
                      ),
                type: PageTransitionType.rightToLeft,
              );
            }

            return null;
          },
        );
      },
    );
  }
}
