import 'package:universal_html/html.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:trent_u_class_locator/services/image_file_service/image_file_service.dart';
import 'package:trent_u_class_locator/universals/arguments.dart';
import 'package:trent_u_class_locator/universals/variables.dart';

class TrentRoom extends StatefulWidget {
  const TrentRoom({
    super.key,
    required this.centerIndex,
    required this.floorIndex,
    required this.roomIndex,
  });

  final int? centerIndex;
  final int? floorIndex;
  final int? roomIndex;

  @override
  State<TrentRoom> createState() => _TrentRoomState();
}

class _TrentRoomState extends State<TrentRoom> {
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
                                    shadowColor: Theme.of(
                                      context!,
                                    ).colorScheme.surface,
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
                                            globalTrentAppNotifier!
                                                        .getImageViewQuality() ==
                                                    1
                                                ? trentCentersDB[
                                                        widget.centerIndex!]!
                                                    .trentCenterFloors![
                                                        widget.floorIndex!]!
                                                    .rooms![widget.roomIndex!]!
                                                    .fHDImageAssetPath!
                                                : trentCentersDB[
                                                        widget.centerIndex!]!
                                                    .trentCenterFloors![
                                                        widget.floorIndex!]!
                                                    .rooms![widget.roomIndex!]!
                                                    .hDImageAssetPath!,
                                            width: MediaQuery.of(
                                                      context,
                                                    ).size.width >
                                                    550.0
                                                ? 550.0
                                                : MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              if (await Permission.photos
                                                  .request()
                                                  .isGranted) {
                                                await GallerySaver.saveImage(
                                                  (await getFilePathFromAssets(
                                                    file:
                                                        await getFileFromAssets(
                                                      assetPath: globalTrentAppNotifier!
                                                                  .getImageDownloadQuality() ==
                                                              1
                                                          ? trentCentersDB[
                                                                  widget
                                                                      .centerIndex!]!
                                                              .trentCenterFloors![
                                                                  widget
                                                                      .floorIndex!]!
                                                              .rooms![
                                                                  widget
                                                                      .roomIndex!]!
                                                              .fHDImageAssetPath!
                                                          : trentCentersDB[
                                                                  widget
                                                                      .centerIndex!]!
                                                              .trentCenterFloors![
                                                                  widget
                                                                      .floorIndex!]!
                                                              .rooms![widget
                                                                  .roomIndex!]!
                                                              .hDImageAssetPath!,
                                                    ),
                                                  ))!,
                                                  albumName:
                                                      'TrentUClassLocator',
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
                                                        "${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.centerCode} ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.roomNumber} Image Saved",
                                                        style: TextStyle(
                                                          color: Theme.of(
                                                            context,
                                                          )
                                                              .colorScheme
                                                              .onSurface,
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                            } catch (e) {
                                              AnchorElement(
                                                href: globalTrentAppNotifier!
                                                            .getImageDownloadQuality() ==
                                                        1
                                                    ? trentCentersDB[widget
                                                            .centerIndex!]!
                                                        .trentCenterFloors![
                                                            widget.floorIndex!]!
                                                        .rooms![
                                                            widget.roomIndex!]!
                                                        .fHDImageAssetPath!
                                                    : trentCentersDB[widget
                                                            .centerIndex!]!
                                                        .trentCenterFloors![
                                                            widget.floorIndex!]!
                                                        .rooms![
                                                            widget.roomIndex!]!
                                                        .hDImageAssetPath!,
                                              )
                                                ..setAttribute(
                                                  'download',
                                                  globalTrentAppNotifier!
                                                              .getImageDownloadQuality() ==
                                                          1
                                                      ? trentCentersDB[widget
                                                              .centerIndex!]!
                                                          .trentCenterFloors![
                                                              widget
                                                                  .floorIndex!]!
                                                          .rooms![widget
                                                              .roomIndex!]!
                                                          .fHDImageAssetPath!
                                                          .split(
                                                            '/',
                                                          )[-1]
                                                      : trentCentersDB[widget
                                                              .centerIndex!]!
                                                          .trentCenterFloors![
                                                              widget
                                                                  .floorIndex!]!
                                                          .rooms![widget
                                                              .roomIndex!]!
                                                          .hDImageAssetPath!
                                                          .split(
                                                            '/',
                                                          )[-1],
                                                )
                                                ..click();

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
                                                      "Campus Map v2 Saved",
                                                      style: TextStyle(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
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
                                    .trentCenterFloors![widget.floorIndex!]!
                                    .rooms![widget.roomIndex!]!
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
                                    "Info",
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
                        Hero(
                          tag: "pageTitleHeader",
                          child: Card(
                            child: SizedBox(
                              height: 60.0,
                              child: Center(
                                child: Text(
                                  "${trentCentersDB[widget.centerIndex!]!.trentCenterName!}   ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.floorName!}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              child: SizedBox(
                                width: MediaQuery.of(
                                          context!,
                                        ).size.width >
                                        550.0
                                    ? 490.0 / 2
                                    : MediaQuery.of(
                                          context,
                                        ).size.width /
                                        2.4,
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Text(
                                        "Room Capacity:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ZarBrush',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        trentCentersDB[widget.centerIndex!]!
                                            .trentCenterFloors![
                                                widget.floorIndex!]!
                                            .rooms![widget.roomIndex!]!
                                            .roomCapacity!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ZarBrush',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: SizedBox(
                                width: MediaQuery.of(
                                          context,
                                        ).size.width >
                                        550.0
                                    ? 490.0 / 2
                                    : MediaQuery.of(
                                          context,
                                        ).size.width /
                                        2.4,
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Text(
                                        "Room Type:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ZarBrush',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        trentCentersDB[widget.centerIndex!]!
                                            .trentCenterFloors![
                                                widget.floorIndex!]!
                                            .rooms![widget.roomIndex!]!
                                            .roomType!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ZarBrush',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.location_on_rounded,
                            ),
                            title: const Text(
                              "Find",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ZarBrush',
                                fontSize: 22,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right_rounded,
                            ),
                            onTap: () async {
                              await Navigator.pushNamed(
                                context,
                                '/room/find',
                                arguments: TrentFindArguments(
                                  centerIndex: widget.centerIndex,
                                  floorIndex: widget.floorIndex,
                                  roomIndex: widget.roomIndex,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(
                                context,
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
                                  "${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.centerCode!} ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.roomNumber!}",
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
