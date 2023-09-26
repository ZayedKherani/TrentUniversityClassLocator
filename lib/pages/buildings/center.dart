import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:trent_u_class_find/universals/arguments.dart';

import 'package:trent_u_class_find/services/image_file_service/image_file_service.dart';
import 'package:trent_u_class_find/universals/variables.dart';

class TrentCenter extends StatefulWidget {
  const TrentCenter({
    super.key,
    required this.centerIndex,
  });

  final int? centerIndex;

  @override
  State<TrentCenter> createState() => _TrentCenterState();
}

class _TrentCenterState extends State<TrentCenter> {
  ScrollController? centerPageScrollController;

  @override
  void initState() {
    centerPageScrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    centerPageScrollController!.dispose();

    super.dispose();
  }

  @override
  Widget build(
    BuildContext? context,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Scrollbar(
              // controller: centerPageScrollController!,
              interactive: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 80.0,
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context!,
                                  builder: (
                                    BuildContext? context,
                                  ) =>
                                      Dialog(
                                    backgroundColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              12.0,
                                            ),
                                          ),
                                          child: Image.asset(
                                            trentCentersDB[widget.centerIndex!]!
                                                .hDImageAssetPath!,
                                            width: MediaQuery.of(
                                              context!,
                                            ).size.width,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (await Permission.photos
                                                .request()
                                                .isGranted) {
                                              await GallerySaver.saveImage(
                                                (await getFilePathFromAssets(
                                                  file: await getFileFromAssets(
                                                    assetPath: trentCentersDB[
                                                            widget
                                                                .centerIndex!]!
                                                        .hDImageAssetPath!,
                                                  ),
                                                ))!,
                                                albumName: 'TrentUClassFind',
                                              );

                                              if (context.mounted) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    backgroundColor: Theme.of(
                                                      context,
                                                    ).colorScheme.surface,
                                                    content: Text(
                                                      "${trentCentersDB[widget.centerIndex!]!.trentCenterName!} Image Saved",
                                                      style: TextStyle(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                      ),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        12.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          child: const Text(
                                            "Save Image",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                trentCentersDB[widget.centerIndex!]!
                                    .reviewImageAssetPath!,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Hero(
                          tag: "expansionHeader",
                          child: SizedBox(
                            height: 60.0,
                            child: Material(
                              color: Colors.transparent,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    "Floors",
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          controller: centerPageScrollController,
                          itemCount: trentCentersDB[widget.centerIndex!]!
                              .trentCenterFloors!
                              .length,
                          itemBuilder: (
                            BuildContext? context,
                            int? floorIndex,
                          ) =>
                              Card(
                            child: ExpansionTile(
                              maintainState: true,
                              controller: ExpansionTileController(),
                              onExpansionChanged: (
                                bool? isExpanded,
                              ) {},
                              title: Text(
                                trentCentersDB[widget.centerIndex!]!
                                    .trentCenterFloors![floorIndex!]!
                                    .floorName!,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "View ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![floorIndex]!.floorName!}",
                                  ),
                                  trailing: const Icon(
                                    Icons.chevron_right_rounded,
                                  ),
                                  onTap: () async {
                                    await Navigator.pushNamed(
                                      context!,
                                      '/floor',
                                      arguments: TrentFloorArguments(
                                        centerIndex: widget.centerIndex!,
                                        floorIndex: floorIndex,
                                      ),
                                    );
                                  },
                                ),
                                ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      trentCentersDB[widget.centerIndex!]!
                                          .trentCenterFloors![floorIndex]!
                                          .rooms!
                                          .length,
                                  itemBuilder: (
                                    BuildContext? context,
                                    int? roomIndex,
                                  ) =>
                                      ListTile(
                                    title: Text(
                                      trentCentersDB[widget.centerIndex!]!
                                          .trentCenterFloors![floorIndex]!
                                          .rooms![roomIndex!]!
                                          .roomNumber!,
                                    ),
                                    leading: Text(
                                      trentCentersDB[widget.centerIndex!]!
                                          .trentCenterFloors![floorIndex]!
                                          .rooms![roomIndex]!
                                          .centerCode!,
                                    ),
                                    trailing: const Icon(
                                      Icons.chevron_right_rounded,
                                    ),
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                        context!,
                                        '/room',
                                        arguments: TrentRoomArguments(
                                          centerIndex: widget.centerIndex!,
                                          floorIndex: floorIndex,
                                          roomIndex: roomIndex,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(
                                context!,
                              ).size.height /
                              10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        0x00000000,
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
                            context,
                          ).colorScheme.surface,
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  trentCentersDB[widget.centerIndex!]!
                                      .trentCenterName!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                  ),
                                  onPressed: () => Navigator.pop(
                                    context,
                                  ),
                                  iconSize: 28.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
