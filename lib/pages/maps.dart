import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trent_u_class_locator/services/image_file_service/image_file_service.dart';
import 'package:universal_html/html.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({
    super.key,
  });

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(
    BuildContext? context,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
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
                                        shadowColor: Colors.transparent,
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
                                                image: const AssetImage(
                                                  "assets/images/maps/full/trentmap1.jpg",
                                                ),
                                                width: MediaQuery.of(
                                                          context!,
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
                                                    milliseconds: 500,
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
                                                  if (loadingProgress != null) {
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
                                                  return AnimatedOpacity(
                                                    opacity: 1,
                                                    duration: const Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeOut,
                                                    child: child,
                                                  );
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
                                                          assetPath:
                                                              "assets/images/maps/full/trentmap1.jpg",
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
                                                          ).colorScheme.surface,
                                                          content: Text(
                                                            "Campus Map Saved",
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
                                                    href:
                                                        "assets/images/maps/full/trentmap1.jpg",
                                                  )
                                                    ..setAttribute(
                                                      'download',
                                                      'trentmap1.jpg',
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
                                                        margin: const EdgeInsets
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
                                                "Save Map",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image(
                                    image: const AssetImage(
                                      "assets/images/maps/small/trentmap1small.jpg",
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
                                        milliseconds: 500,
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
                              ),
                            ),
                            const Card(
                              child: Center(
                                child: Text(
                                  "Campus Map",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
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
                                        shadowColor: Colors.transparent,
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
                                                image: const AssetImage(
                                                  "assets/images/maps/full/trentmap2.jpg",
                                                ),
                                                width: MediaQuery.of(
                                                          context!,
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
                                                    milliseconds: 500,
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
                                                  if (loadingProgress != null) {
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
                                                  return AnimatedOpacity(
                                                    opacity: 1,
                                                    duration: const Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeOut,
                                                    child: child,
                                                  );
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
                                                          assetPath:
                                                              "assets/images/maps/full/trentmap2.jpg",
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
                                                } catch (e) {
                                                  AnchorElement(
                                                    href:
                                                        "assets/images/maps/full/trentmap2.jpg",
                                                  )
                                                    ..setAttribute(
                                                      'download',
                                                      'trentmap2.jpg',
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
                                                        margin: const EdgeInsets
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
                                                "Save Map",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image(
                                    image: const AssetImage(
                                      "assets/images/maps/small/trentmap2small.jpg",
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
                                        milliseconds: 500,
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
                              ),
                            ),
                            const Card(
                              child: Center(
                                child: Text(
                                  "Campus Map v2",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
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
                                        shadowColor: Colors.transparent,
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
                                                image: const AssetImage(
                                                  "assets/images/maps/full/aerialview.jpg",
                                                ),
                                                width: MediaQuery.of(
                                                          context!,
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
                                                    milliseconds: 500,
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
                                                  if (loadingProgress != null) {
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
                                                  return AnimatedOpacity(
                                                    opacity: 1,
                                                    duration: const Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeOut,
                                                    child: child,
                                                  );
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
                                                          assetPath:
                                                              "assets/images/maps/full/aerialview.jpg",
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
                                                          ).colorScheme.surface,
                                                          content: Text(
                                                            "Aerial View Image Saved",
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
                                                    href:
                                                        "assets/images/maps/full/aerialview.jpg",
                                                  )
                                                    ..setAttribute(
                                                      'download',
                                                      'aerialview.jpg',
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
                                                        margin: const EdgeInsets
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
                                    image: const AssetImage(
                                      "assets/images/maps/small/aerialviewsmall.jpg",
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
                                        milliseconds: 500,
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
                              ),
                            ),
                            const Card(
                              child: Center(
                                child: Text(
                                  "Aerial View of Campus",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
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
                                        shadowColor: Colors.transparent,
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
                                                image: const AssetImage(
                                                  "assets/images/maps/full/trentmap3.jpg",
                                                ),
                                                width: MediaQuery.of(
                                                          context!,
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
                                                    milliseconds: 500,
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
                                                  if (loadingProgress != null) {
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
                                                  return AnimatedOpacity(
                                                    opacity: 1,
                                                    duration: const Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeOut,
                                                    child: child,
                                                  );
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
                                                          assetPath:
                                                              "assets/images/maps/full/trentmap3.jpg",
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
                                                          ).colorScheme.surface,
                                                          content: Text(
                                                            "Traill Campus Map Saved",
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
                                                    href:
                                                        "assets/images/maps/full/trentmap3.jpg",
                                                  )
                                                    ..setAttribute(
                                                      'download',
                                                      'trentmap3.jpg',
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
                                                        margin: const EdgeInsets
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
                                                "Save Map",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image(
                                    image: const AssetImage(
                                      "assets/images/maps/small/trentmap3small.jpg",
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
                                        milliseconds: 500,
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
                              ),
                            ),
                            const Card(
                              child: Center(
                                child: Text(
                                  "Traill Campus Map",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZarBrush',
                                    fontSize: 28,
                                  ),
                                ),
                              ),
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
                              child: const Center(
                                child: Text(
                                  "Maps",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
