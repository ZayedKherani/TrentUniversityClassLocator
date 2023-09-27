import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trent_u_class_locator/models/center/center.dart';
import 'package:trent_u_class_locator/models/floor/floor.dart';
import 'package:trent_u_class_locator/models/room/room.dart';
import 'package:trent_u_class_locator/services/image_file_service/image_file_service.dart';
import 'package:trent_u_class_locator/universals/variables.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({
    super.key,
  });

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
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
                    child: Container(
                      color: Colors.transparent,
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
                          const Card(
                            child: Center(
                              child: Text(
                                "Buildings",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ZarBrush',
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 260.0,
                              enableInfiniteScroll: true,
                              animateToClosest: true,
                              autoPlay: false,
                              initialPage: 0,
                              disableCenter: true,
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              pageSnapping: true,
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              enlargeFactor: 0.3,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.85,
                            ),
                            items: trentCentersDB.asMap().entries.map(
                              (
                                MapEntry<int?, TrentCenterModel?>? map,
                              ) {
                                return Builder(
                                  builder: (
                                    BuildContext? context,
                                  ) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(
                                            context!,
                                          ).size.width,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0,
                                          ),
                                          child: GestureDetector(
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (
                                                  BuildContext? context,
                                                ) =>
                                                    Dialog(
                                                  shadowColor: Theme.of(
                                                    context!,
                                                  ).colorScheme.surface,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  surfaceTintColor:
                                                      Colors.transparent,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(
                                                            12.0,
                                                          ),
                                                        ),
                                                        child: Image.asset(
                                                          map.value!
                                                              .hDImageAssetPath!,
                                                          width: MediaQuery.of(
                                                            context,
                                                          ).size.width,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          if (await Permission
                                                              .photos
                                                              .request()
                                                              .isGranted) {
                                                            await GallerySaver
                                                                .saveImage(
                                                              (await getFilePathFromAssets(
                                                                file:
                                                                    await getFileFromAssets(
                                                                  assetPath: map
                                                                      .value!
                                                                      .hDImageAssetPath!,
                                                                ),
                                                              ))!,
                                                              albumName:
                                                                  'TrentUClassLocator',
                                                            );

                                                            if (context
                                                                .mounted) {
                                                              ScaffoldMessenger
                                                                  .of(
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
                                                                    "${map.value!.trentCenterName!} Image Saved",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Theme
                                                                              .of(
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
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  12.0,
                                                ),
                                              ),
                                              child: SizedBox(
                                                height: 200.0,
                                                child: Image.asset(
                                                  map!.value!.hDImageAssetPath!,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Card(
                                          child: Center(
                                            child: Text(
                                              map.value!.trentCenterName!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'ZarBrush',
                                                fontSize: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ).toList(
                              growable: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Card(
                            child: Center(
                              child: Text(
                                "Rooms",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ZarBrush',
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 260.0,
                              enableInfiniteScroll: true,
                              animateToClosest: true,
                              autoPlay: false,
                              initialPage: 0,
                              disableCenter: true,
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              pageSnapping: true,
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              enlargeFactor: 0.3,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.85,
                            ),
                            items: () {
                              List<TrentRoomModel?>? allTrentRooms = [];

                              for (TrentCenterModel? trentCenterModel
                                  in trentCentersDB) {
                                for (TrentFloorModel? trentFloorModel
                                    in trentCenterModel!.trentCenterFloors!) {
                                  for (TrentRoomModel? trentRoomModel
                                      in trentFloorModel!.rooms!) {
                                    allTrentRooms.add(
                                      trentRoomModel,
                                    );
                                  }
                                }
                              }

                              return allTrentRooms.asMap().entries.map(
                                (
                                  MapEntry<int?, TrentRoomModel?>? map,
                                ) {
                                  return Builder(
                                    builder: (
                                      BuildContext? context,
                                    ) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0,
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
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    surfaceTintColor:
                                                        Colors.transparent,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                              12.0,
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                            globalTrentAppNotifier!.getImageViewQuality() ==
                                                                    1
                                                                ? map.value!
                                                                    .fHDImageAssetPath!
                                                                : map.value!
                                                                    .hDImageAssetPath!,
                                                            width:
                                                                MediaQuery.of(
                                                              context,
                                                            ).size.width,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            if (await Permission
                                                                .photos
                                                                .request()
                                                                .isGranted) {
                                                              await GallerySaver
                                                                  .saveImage(
                                                                (await getFilePathFromAssets(
                                                                  file:
                                                                      await getFileFromAssets(
                                                                    assetPath: globalTrentAppNotifier!.getImageDownloadQuality() ==
                                                                            1
                                                                        ? map
                                                                            .value!
                                                                            .fHDImageAssetPath!
                                                                        : map
                                                                            .value!
                                                                            .hDImageAssetPath!,
                                                                  ),
                                                                ))!,
                                                                albumName:
                                                                    'TrentUClassLocator',
                                                              );

                                                              if (context
                                                                  .mounted) {
                                                                ScaffoldMessenger
                                                                    .of(
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
                                                                        Theme
                                                                            .of(
                                                                      context,
                                                                    ).colorScheme.surface,
                                                                    content:
                                                                        Text(
                                                                      "${map.value!.centerCode} ${map.value!.roomNumber!} Image Saved",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Theme
                                                                            .of(
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
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    12.0,
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  height: 200.0,
                                                  child: Image.asset(
                                                    map!.value!
                                                        .reviewImageAssetPath!,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Card(
                                            child: Center(
                                              child: Text(
                                                "${map.value!.centerCode} ${map.value!.roomNumber!}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'ZarBrush',
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ).toList(
                                growable: true,
                              );
                            }(),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Card(
                            child: Center(
                              child: Text(
                                "Maps",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ZarBrush',
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 155.0,
                              enableInfiniteScroll: true,
                              animateToClosest: true,
                              autoPlay: false,
                              initialPage: 0,
                              disableCenter: true,
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              pageSnapping: true,
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              enlargeFactor: 0.3,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.85,
                            ),
                            items: () {
                              List<List<String?>?>? allMaps = [
                                [
                                  "assets/images/maps/full/trentmap1.jpg",
                                  "assets/images/maps/small/trentmap1small.jpg",
                                  "Campus Map",
                                  "Campus Map Saved",
                                  "Save Map",
                                ],
                                [
                                  "assets/images/maps/full/trentmap2.jpg",
                                  "assets/images/maps/small/trentmap2small.jpg",
                                  "Campus Map v2",
                                  "Campus Map v2 Saved",
                                  "Save Map",
                                ],
                                [
                                  "assets/images/maps/full/aerialview.jpg",
                                  "assets/images/maps/small/aerialviewsmall.jpg",
                                  "Aerial View of Campus",
                                  "Aerial View Image Saved",
                                  "Save Image",
                                ],
                                [
                                  "assets/images/maps/full/trentmap3.jpg",
                                  "assets/images/maps/small/trentmap3small.jpg",
                                  "Traill Campus Map",
                                  "Traill Campus Map Saved",
                                  "Save Map",
                                ],
                              ];

                              return allMaps.asMap().entries.map(
                                (
                                  MapEntry<int?, List<String?>?>? map,
                                ) {
                                  return Builder(
                                    builder: (
                                      BuildContext? context,
                                    ) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0,
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
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    surfaceTintColor:
                                                        Colors.transparent,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                              12.0,
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                            map.value![0]!,
                                                            width:
                                                                MediaQuery.of(
                                                              context,
                                                            ).size.width,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            if (await Permission
                                                                .photos
                                                                .request()
                                                                .isGranted) {
                                                              await GallerySaver
                                                                  .saveImage(
                                                                (await getFilePathFromAssets(
                                                                  file:
                                                                      await getFileFromAssets(
                                                                    assetPath:
                                                                        map.value![
                                                                            0]!,
                                                                  ),
                                                                ))!,
                                                                albumName:
                                                                    'TrentUClassLocator',
                                                              );

                                                              if (context
                                                                  .mounted) {
                                                                ScaffoldMessenger
                                                                    .of(
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
                                                                        Theme
                                                                            .of(
                                                                      context,
                                                                    ).colorScheme.surface,
                                                                    content:
                                                                        Text(
                                                                      map.value![
                                                                          3]!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Theme
                                                                            .of(
                                                                          context,
                                                                        ).colorScheme.onSurface,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: Text(
                                                            map.value![4]!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    12.0,
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  child: Image.asset(
                                                    map!.value![1]!,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Card(
                                            child: Center(
                                              child: Text(
                                                map.value![2]!,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'ZarBrush',
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ).toList(
                                growable: true,
                              );
                            }(),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Card(
                            child: Center(
                              child: Text(
                                "Wallpapers",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ZarBrush',
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 260.0,
                              enableInfiniteScroll: true,
                              animateToClosest: true,
                              autoPlay: false,
                              initialPage: 0,
                              disableCenter: true,
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              pageSnapping: true,
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              enlargeFactor: 0.3,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.85,
                            ),
                            items: () {
                              List<List<String?>?>? allMaps = [
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent1.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent1.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent1.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent1.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent1.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent1.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent2.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent2.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent2.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent2.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent2.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent2.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent3.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent3.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent3.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent3.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent3.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent3.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent4.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent4.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent4.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent4.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent4.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent4.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent5.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent5.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent5.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent5.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent5.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent5.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent6.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent6.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent6.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent6.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent6.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent6.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent7.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent7.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent7.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent7.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent7.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent7.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent8.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent8.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent8.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent8.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent8.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent8.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent9.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent9.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent9.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent9.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent9.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent9.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent10.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent10.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent10.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent10.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent10.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent10.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent11.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent11.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent11.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent11.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent11.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent11.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent12.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent12.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent12.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent12.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent12.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent12.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent13.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent13.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent13.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent13.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent13.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent13.jpg",
                                ],
                                [
                                  "300x200",
                                  "assets/images/wallpapers/w300/trent14.jpg",
                                  "1920x1080",
                                  "assets/images/wallpapers/1080/trent14.jpg",
                                  "1920x1200",
                                  "assets/images/wallpapers/widescreen/trent14.jpg",
                                  "2880x1620",
                                  "assets/images/wallpapers/1620/trent14.jpg",
                                  "2880x1800",
                                  "assets/images/wallpapers/macretina/trent14.jpg",
                                  "2880x1920",
                                  "assets/images/wallpapers/highrez/trent14.jpg",
                                ],
                              ];

                              return allMaps.asMap().entries.map(
                                (
                                  MapEntry<int?, List<String?>?>? map,
                                ) {
                                  return Builder(
                                    builder: (
                                      BuildContext? context,
                                    ) {
                                      return Card(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showDialog(
                                              context: context!,
                                              builder: (
                                                BuildContext? context,
                                              ) =>
                                                  Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                surfaceTintColor:
                                                    Colors.transparent,
                                                shadowColor: Theme.of(
                                                  context!,
                                                ).colorScheme.surface,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(
                                                          12.0,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        map.value![11]!,
                                                        width: MediaQuery.of(
                                                          context,
                                                        ).size.width,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: 5,
                                                      itemBuilder: (
                                                        BuildContext? context,
                                                        int? resolutionIndex,
                                                      ) =>
                                                          ElevatedButton(
                                                        onPressed: () async {
                                                          if (await Permission
                                                              .photos
                                                              .request()
                                                              .isGranted) {
                                                            await GallerySaver
                                                                .saveImage(
                                                              (await getFilePathFromAssets(
                                                                file:
                                                                    await getFileFromAssets(
                                                                  assetPath: map
                                                                          .value![
                                                                      (resolutionIndex *
                                                                              2) +
                                                                          1]!,
                                                                ),
                                                              ))!,
                                                              albumName:
                                                                  'TrentUClassLocator',
                                                            );

                                                            if (context !=
                                                                    null &&
                                                                context
                                                                    .mounted) {
                                                              ScaffoldMessenger
                                                                  .of(
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
                                                                    "${map.value![resolutionIndex * 2]!} Image Saved",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Theme
                                                                              .of(
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
                                                        child: Text(
                                                          "Save ${map.value![resolutionIndex! * 2]!} Image",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                12.0,
                                              ),
                                            ),
                                            child: SizedBox(
                                              child: Image.asset(
                                                map!.value![1]!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).toList(
                                growable: true,
                              );
                            }(),
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
                                  "Media",
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
