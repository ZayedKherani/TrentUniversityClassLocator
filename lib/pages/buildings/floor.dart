import 'package:flutter/material.dart';
import 'package:trent_u_class_find/universals/arguments.dart';

import 'package:trent_u_class_find/universals/variables.dart';

class TrentFloor extends StatefulWidget {
  const TrentFloor({
    super.key,
    required this.centerIndex,
    required this.floorIndex,
  });

  final int? centerIndex;
  final int? floorIndex;

  @override
  State<TrentFloor> createState() => _TrentFloorState();
}

class _TrentFloorState extends State<TrentFloor> {
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
              controller: centerPageScrollController!,
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
                          tag: "pageTitleHeader",
                          child: SizedBox(
                            height: 60.0,
                            child: Material(
                              color: Colors.transparent,
                              child: Card(
                                child: Center(
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
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                                    "Rooms",
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
                              .trentCenterFloors![widget.floorIndex!]!
                              .rooms!
                              .length,
                          itemBuilder: (
                            BuildContext? context,
                            int? roomIndex,
                          ) =>
                              Card(
                            child: ListTile(
                              title: Text(
                                trentCentersDB[widget.centerIndex!]!
                                    .trentCenterFloors![widget.floorIndex!]!
                                    .rooms![roomIndex!]!
                                    .roomNumber!,
                              ),
                              leading: Text(
                                trentCentersDB[widget.centerIndex!]!
                                    .trentCenterFloors![widget.floorIndex!]!
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
                                    centerIndex: widget.centerIndex,
                                    floorIndex: widget.floorIndex,
                                    roomIndex: roomIndex,
                                  ),
                                );
                              },
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
                                      .trentCenterFloors![widget.floorIndex!]!
                                      .floorName!,
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
