import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trent_u_class_locator/pages/not_found.dart';
import 'package:trent_u_class_locator/pages/buildings/find.dart';
import 'package:trent_u_class_locator/pages/terms.dart';

import 'package:trent_u_class_locator/universals/arguments.dart';
import 'package:trent_u_class_locator/pages/buildings/center.dart';
import 'package:trent_u_class_locator/pages/buildings/floor.dart';
import 'package:trent_u_class_locator/pages/buildings/room.dart';
import 'package:trent_u_class_locator/pages/home.dart';
import 'package:trent_u_class_locator/pages/settings/license_page.dart';
import 'package:trent_u_class_locator/pages/settings/settings.dart';
import 'package:trent_u_class_locator/services/trent_app_notifier_service/trent_app_notifier_service.dart';
import 'package:trent_u_class_locator/universals/theme.dart';
import 'package:trent_u_class_locator/pages/settings/package_page.dart';
import 'package:trent_u_class_locator/universals/variables.dart';

void main() {
  WidgetsBinding? widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  runApp(
    ChangeNotifierProvider<TrentAppNotifierService>(
      create: (
        BuildContext? context,
      ) =>
          TrentAppNotifierService(),
      child: const TrentUniversityClassLocatorApp(),
    ),
  );
}

class TrentUniversityClassLocatorApp extends StatefulWidget {
  const TrentUniversityClassLocatorApp({
    super.key,
  });

  @override
  State<TrentUniversityClassLocatorApp> createState() =>
      _TrentUniversityClassLocatorAppState();
}

class _TrentUniversityClassLocatorAppState
    extends State<TrentUniversityClassLocatorApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(
    BuildContext? context,
  ) {
    return Consumer<TrentAppNotifierService>(
      builder: (
        BuildContext? context,
        TrentAppNotifierService? theme,
        Widget? child,
      ) {
        globalTrentAppNotifier = theme;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: 'Trent University Class Locator',
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
                const TrentUniversityClassLocatorHome(),
            '/settings': (
              BuildContext? context,
            ) =>
                const TrentAppSettingsPage(),
            '/terms': (
              BuildContext? context,
            ) =>
                const TermsPage(),
          },
          onGenerateRoute: (
            RouteSettings? settings,
          ) {
            if (settings!.name == '/center') {
              final TrentCenterArguments args =
                  settings.arguments as TrentCenterArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
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
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/floor') {
              final TrentFloorArguments args =
                  settings.arguments as TrentFloorArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
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
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/room') {
              final TrentRoomArguments args =
                  settings.arguments as TrentRoomArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
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
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/settings/licenses') {
              final TrentAppSettingsLicensePageArguments args =
                  settings.arguments as TrentAppSettingsLicensePageArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
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
                          applicationIconAssetPath:
                              args.applicationIconAssetPath,
                        ),
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/settings/licenses/package') {
              final TrentAppSettingsLicensePackagePageArguments args = settings
                  .arguments as TrentAppSettingsLicensePackagePageArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
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
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            if (settings.name == '/room/find') {
              final TrentFindArguments args =
                  settings.arguments as TrentFindArguments;

              return PageTransition(
                child: Container(
                  color:
                      globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                          ? Colors.black
                          : globalTrentAppNotifier!.getThemeMode() ==
                                  ThemeMode.light
                              ? Colors.white
                              : MediaQuery.of(
                                        context!,
                                      ).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white,
                  child: MediaQuery.of(
                            context!,
                          ).size.width >
                          600
                      ? Center(
                          child: SizedBox(
                            width: 550.0,
                            child: TrentFind(
                              centerIndex: args.centerIndex,
                              floorIndex: args.floorIndex,
                              roomIndex: args.roomIndex,
                            ),
                          ),
                        )
                      : TrentFind(
                          centerIndex: args.centerIndex,
                          floorIndex: args.floorIndex,
                          roomIndex: args.roomIndex,
                        ),
                ),
                type: PageTransitionType.rightToLeft,
              );
            }

            return null;
          },
          onUnknownRoute: (
            RouteSettings? settings,
          ) =>
              PageTransition(
            child: Container(
              color: globalTrentAppNotifier!.getThemeMode() == ThemeMode.dark
                  ? Colors.black
                  : globalTrentAppNotifier!.getThemeMode() == ThemeMode.light
                      ? Colors.white
                      : MediaQuery.of(
                                context!,
                              ).platformBrightness ==
                              Brightness.dark
                          ? Colors.black
                          : Colors.white,
              child: MediaQuery.of(
                        context!,
                      ).size.width >
                      600
                  ? const Center(
                      child: SizedBox(
                        width: 550.0,
                        child: UnknownPage(),
                      ),
                    )
                  : const UnknownPage(),
            ),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
    );
  }
}
