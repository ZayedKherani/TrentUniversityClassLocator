import 'package:flutter/material.dart';
import 'package:trent_u_class_find/pages/buildings/buildings.dart';
import 'package:trent_u_class_find/pages/maps.dart';
import 'package:trent_u_class_find/pages/media.dart';
import 'package:trent_u_class_find/universals/variables.dart';

class TrentClassFindHome extends StatefulWidget {
  const TrentClassFindHome({
    super.key,
  });

  @override
  State<TrentClassFindHome> createState() => _TrentClassFindHomeState();
}

class _TrentClassFindHomeState extends State<TrentClassFindHome>
    with SingleTickerProviderStateMixin {
  int? bottomNavIndex = 0;

  @override
  void initState() {
    campusLinksMenuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    campusLinksMenuAnimationProgress = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: campusLinksMenuAnimationController!,
        curve: Curves.easeInOut,
      ),
    );

    buildingsPageScrollController = ScrollController();
    quickSearchController = TextEditingController();

    campusLinksMenuController = ExpansionTileController();

    quickSearchFocusNode = FocusNode();

    quickSearchFormKey = GlobalKey<FormState>();

    super.initState();
  }

  Widget? trentClassFindHome(
    BuildContext? context,
  ) =>
      GestureDetector(
        onTap: () {
          quickSearchFocusNode!.hasFocus
              ? quickSearchFocusNode!.unfocus()
              : null;
        },
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                <Widget>[
                  const BuildingsPage(),
                  const MapsPage(),
                  const MediaPage(),
                ][bottomNavIndex!],
                Hero(
                  tag: 'AppBar',
                  child: SizedBox(
                    height: 70.0,
                    child: Material(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          color: const Color(
                            0x000000ff,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                            child: Container(
                              height: 70.0,
                              width: double.infinity,
                              color: Theme.of(
                                context!,
                              ).colorScheme.surface,
                              child: const Center(
                                child: Text(
                                  'Trent University Class Find',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                      child: NavigationBarTheme(
                        data: NavigationBarThemeData(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surface,
                          // height: 40.0,
                        ),
                        child: NavigationBar(
                          onDestinationSelected: (
                            int? index,
                          ) {
                            setState(
                              () {
                                bottomNavIndex = index;
                              },
                            );
                          },
                          selectedIndex: bottomNavIndex!,
                          destinations: const <Widget>[
                            NavigationDestination(
                              label: 'Buildings',
                              icon: Icon(
                                Icons.location_city_rounded,
                              ),
                            ),
                            NavigationDestination(
                              label: 'Maps',
                              icon: Icon(
                                Icons.location_pin,
                              ),
                            ),
                            NavigationDestination(
                              label: 'Media',
                              icon: Icon(
                                Icons.perm_media_rounded,
                              ),
                            ),
                          ],
                          elevation: 8.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(
    BuildContext? context,
  ) {
    if (MediaQuery.of(
          context!,
        ).size.width >
        600.0) {
      return Container(
        color: Theme.of(
          context,
        ).colorScheme.background,
        child: Center(
          child: SizedBox(
            width: 550.0,
            child: trentClassFindHome(
              context,
            ),
          ),
        ),
      );
    }

    return trentClassFindHome(
      context,
    )!;
  }
}
