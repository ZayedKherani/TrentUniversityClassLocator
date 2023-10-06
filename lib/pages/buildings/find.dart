import 'package:universal_html/html.dart';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trent_u_class_locator/services/image_file_service/image_file_service.dart';
import 'package:trent_u_class_locator/universals/variables.dart';

class TrentFind extends StatefulWidget {
  const TrentFind({
    super.key,
    required this.centerIndex,
    required this.floorIndex,
    required this.roomIndex,
  });

  final int? centerIndex;
  final int? floorIndex;
  final int? roomIndex;

  @override
  State<TrentFind> createState() => _TrentFindState();
}

class _TrentFindState extends State<TrentFind> {
  ScrollController? findPageScrollController;

  @override
  void initState() {
    findPageScrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    findPageScrollController!.dispose();

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
              // controller: findPageScrollController!,
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
                        Hero(
                          tag: "expansionHeader",
                          child: SizedBox(
                            height: 60.0,
                            child: Material(
                              color: Colors.transparent,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    "${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.centerCode!} ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.roomNumber!}",
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
                        ListView.builder(
                          shrinkWrap: true,
                          controller: findPageScrollController,
                          itemCount: trentCentersDB[widget.centerIndex!]!
                              .trentCenterFloors![widget.floorIndex!]!
                              .rooms![widget.roomIndex!]!
                              .findRoomSteps!
                              .length,
                          itemBuilder: (
                            BuildContext? context,
                            int? findIndex,
                          ) =>
                              Card(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
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
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    12.0,
                                                  ),
                                                ),
                                                child: Image(
                                                  image: AssetImage(
                                                    globalTrentAppNotifier!
                                                                .getImageViewQuality() ==
                                                            1
                                                        ? trentCentersDB[
                                                                widget
                                                                    .centerIndex!]!
                                                            .trentCenterFloors![
                                                                widget
                                                                    .floorIndex!]!
                                                            .rooms![widget
                                                                .roomIndex!]!
                                                            .findRoomSteps![
                                                                findIndex]!
                                                            .stepFHDImageAssetPath!
                                                        : trentCentersDB[
                                                                widget
                                                                    .centerIndex!]!
                                                            .trentCenterFloors![
                                                                widget
                                                                    .floorIndex!]!
                                                            .rooms![widget
                                                                .roomIndex!]!
                                                            .findRoomSteps![
                                                                findIndex]!
                                                            .stepHDImageAssetPath!,
                                                  ),
                                                  width: MediaQuery.of(
                                                            context,
                                                          ).size.width >
                                                          550.0
                                                      ? 550.0
                                                      : MediaQuery.of(
                                                          context,
                                                        ).size.width,
                                                  frameBuilder: (
                                                    BuildContext? context,
                                                    Widget child,
                                                    int? frame,
                                                    bool wasSynchronouslyLoaded,
                                                  ) =>
                                                      AnimatedOpacity(
                                                    opacity:
                                                        frame == null ? 0 : 1,
                                                    duration: const Duration(
                                                      seconds: 1,
                                                    ),
                                                    curve: Curves.easeOut,
                                                    child: child,
                                                  ),
                                                  loadingBuilder: (
                                                    BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress,
                                                  ) {
                                                    if (loadingProgress !=
                                                        null) {
                                                      return Center(
                                                        child:
                                                            CircularProgressIndicator
                                                                .adaptive(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Theme.of(
                                                              context,
                                                            )
                                                                .colorScheme
                                                                .onSurface,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return child;
                                                  },
                                                  errorBuilder: (
                                                    BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace,
                                                  ) {
                                                    return const Text(
                                                      "Error: Could not load image",
                                                    );
                                                  },
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
                                                      await GallerySaver
                                                          .saveImage(
                                                        (await getFilePathFromAssets(
                                                          file:
                                                              await getFileFromAssets(
                                                            assetPath: globalTrentAppNotifier!
                                                                        .getImageDownloadQuality() ==
                                                                    1
                                                                ? trentCentersDB[widget.centerIndex!]!
                                                                    .trentCenterFloors![
                                                                        widget
                                                                            .floorIndex!]!
                                                                    .rooms![widget
                                                                        .roomIndex!]!
                                                                    .findRoomSteps![
                                                                        findIndex]!
                                                                    .stepFHDImageAssetPath!
                                                                : trentCentersDB[widget.centerIndex!]!
                                                                    .trentCenterFloors![
                                                                        widget
                                                                            .floorIndex!]!
                                                                    .rooms![widget
                                                                        .roomIndex!]!
                                                                    .findRoomSteps![
                                                                        findIndex]!
                                                                    .stepHDImageAssetPath!,
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
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(
                                                              8.0,
                                                            ),
                                                            backgroundColor:
                                                                Theme.of(
                                                              context,
                                                            )
                                                                    .colorScheme
                                                                    .surface,
                                                            content: Text(
                                                              "${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.centerCode} ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.roomNumber} Step ${findIndex + 1} Image Saved",
                                                              style: TextStyle(
                                                                color: Theme.of(
                                                                  context,
                                                                )
                                                                    .colorScheme
                                                                    .onSurface,
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
                                                          ? trentCentersDB[widget.centerIndex!]!
                                                              .trentCenterFloors![widget
                                                                  .floorIndex!]!
                                                              .rooms![widget
                                                                  .roomIndex!]!
                                                              .findRoomSteps![
                                                                  findIndex]!
                                                              .stepFHDImageAssetPath!
                                                          : trentCentersDB[
                                                                  widget
                                                                      .centerIndex!]!
                                                              .trentCenterFloors![
                                                                  widget
                                                                      .floorIndex!]!
                                                              .rooms![widget
                                                                  .roomIndex!]!
                                                              .findRoomSteps![
                                                                  findIndex]!
                                                              .stepHDImageAssetPath!,
                                                    )
                                                      ..setAttribute(
                                                        'download',
                                                        globalTrentAppNotifier!
                                                                    .getImageDownloadQuality() ==
                                                                1
                                                            ? trentCentersDB[
                                                                    widget
                                                                        .centerIndex!]!
                                                                .trentCenterFloors![
                                                                    widget
                                                                        .floorIndex!]!
                                                                .rooms![widget
                                                                    .roomIndex!]!
                                                                .findRoomSteps![
                                                                    findIndex]!
                                                                .stepFHDImageAssetPath!
                                                                .split(
                                                                  '/',
                                                                )[-1]
                                                            : trentCentersDB[
                                                                    widget
                                                                        .centerIndex!]!
                                                                .trentCenterFloors![
                                                                    widget
                                                                        .floorIndex!]!
                                                                .rooms![widget
                                                                    .roomIndex!]!
                                                                .findRoomSteps![
                                                                    findIndex]!
                                                                .stepHDImageAssetPath!
                                                                .split('/')[-1],
                                                      )
                                                      ..click();

                                                    if (context.mounted) {
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        SnackBar(
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(
                                                            8.0,
                                                          ),
                                                          backgroundColor:
                                                              Theme.of(
                                                            context,
                                                          ).colorScheme.surface,
                                                          content: Text(
                                                            "Campus Map v2 Saved",
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                context,
                                                              )
                                                                  .colorScheme
                                                                  .onSurface,
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
                                    child: Image(
                                      image: AssetImage(
                                        trentCentersDB[widget.centerIndex!]!
                                            .trentCenterFloors![
                                                widget.floorIndex!]!
                                            .rooms![widget.roomIndex!]!
                                            .findRoomSteps![findIndex!]!
                                            .stepSmallImageAssetPath!,
                                      ),
                                      frameBuilder: (
                                        BuildContext? context,
                                        Widget child,
                                        int? frame,
                                        bool wasSynchronouslyLoaded,
                                      ) =>
                                          AnimatedOpacity(
                                        opacity: frame == null ? 0 : 1,
                                        duration: const Duration(
                                          seconds: 1,
                                        ),
                                        curve: Curves.easeOut,
                                        child: child,
                                      ),
                                      loadingBuilder: (
                                        BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress,
                                      ) {
                                        if (loadingProgress != null) {
                                          return Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                              ),
                                            ),
                                          );
                                        }
                                        return child;
                                      },
                                      errorBuilder: (
                                        BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace,
                                      ) {
                                        return const Text(
                                          "Error: Could not load image",
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      trentCentersDB[widget.centerIndex!]!
                                          .trentCenterFloors![
                                              widget.floorIndex!]!
                                          .rooms![widget.roomIndex!]!
                                          .findRoomSteps![findIndex]!
                                          .stepDescription!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ZarBrush',
                                        fontSize: 28,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Step #${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.findRoomSteps![findIndex]!.stepNumber!}",
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
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: (MediaQuery.of(
                                    context!,
                                  ).size.height /
                                  10) +
                              10.0,
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
                                  "${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.centerCode!} ${trentCentersDB[widget.centerIndex!]!.trentCenterFloors![widget.floorIndex!]!.rooms![widget.roomIndex!]!.roomNumber!}: Locator",
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
            )
          ],
        ),
      ),
    );
  }
}
