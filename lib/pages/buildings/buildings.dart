import 'package:flutter/material.dart';
import 'package:trent_u_class_find/universals/arguments.dart';
import 'package:trent_u_class_find/universals/variables.dart';

class BuildingsPage extends StatefulWidget {
  const BuildingsPage({
    super.key,
  });

  @override
  State<BuildingsPage> createState() => _BuildingsPageState();
}

class _BuildingsPageState extends State<BuildingsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    setState(
      () {},
    );

    super.initState();
  }

  @override
  Widget build(
    BuildContext? context,
  ) {
    return Scrollbar(
      controller: buildingsPageScrollController!,
      interactive: true,
      trackVisibility: true,
      child: SingleChildScrollView(
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
                child: ListTile(
                  title: Form(
                    key: quickSearchFormKey,
                    child: TextFormField(
                      controller: quickSearchController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        labelText: "Room or Building",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(
                              context!,
                            ).colorScheme.secondary,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.error,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.error,
                            width: 2.0,
                          ),
                        ),
                        focusColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        hoverColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        labelStyle: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                        helperStyle: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                        errorStyle: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.error,
                            ),
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                      ),
                      onSaved: (
                        String? quickSearch,
                      ) {},
                      validator: (
                        String? quickSearch,
                      ) {
                        if (quickSearch!.trim().isEmpty) {
                          return 'Please enter a building or room number.';
                        }

                        return null;
                      },
                      focusNode: quickSearchFocusNode,
                    ),
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_city_rounded,
                        ),
                        label: const Text(
                          "Building",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSecondary,
                          elevation: 4.0,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.door_front_door_rounded,
                        ),
                        label: const Text(
                          "Room",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSecondary,
                          elevation: 4.0,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.navigation_rounded,
                        ),
                        label: const Text(
                          "Visit",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSecondary,
                          elevation: 4.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                child: ExpansionTile(
                  controller: campusLinksMenuController,
                  maintainState: true,
                  title: const Text(
                    "Campus Links",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: campusLinksMenuAnimationProgress!,
                  ),
                  onExpansionChanged: (bool? isExpanded) {
                    if (isExpanded!) {
                      campusLinksMenuAnimationController!.forward();
                    } else {
                      campusLinksMenuAnimationController!.reverse();
                    }
                  },
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      childAspectRatio: (MediaQuery.of(
                            context,
                          ).size.width) /
                          (MediaQuery.of(
                                context,
                              ).size.height /
                              7),
                      crossAxisSpacing: 10.0,
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      controller: buildingsPageScrollController,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.run_circle_outlined,
                          ),
                          label: const Text(
                            "Athletics",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu_book_rounded,
                          ),
                          label: const Text(
                            "Book Store",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.people_alt_rounded,
                          ),
                          label: const Text(
                            "Clubs",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month_rounded,
                          ),
                          label: const Text(
                            "Event Calendar",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.house_rounded,
                          ),
                          label: const Text(
                            "Housing",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu_book_rounded,
                          ),
                          label: const Text(
                            "Library",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                          ),
                          label: const Text(
                            "MyTrent",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.computer_rounded,
                          ),
                          label: const Text(
                            "Tech Services",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.email_rounded,
                          ),
                          label: const Text(
                            "Trent Mail",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.link_rounded,
                          ),
                          label: const Text(
                            "Website",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            elevation: 4.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onSecondary,
                              elevation: 4.0,
                            ),
                            child: const Icon(
                              Icons.facebook_rounded,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onSecondary,
                              elevation: 4.0,
                            ),
                            child: const Icon(
                              Icons.facebook_rounded,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onSecondary,
                              elevation: 4.0,
                            ),
                            child: const Icon(
                              Icons.facebook_rounded,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onSecondary,
                              elevation: 4.0,
                            ),
                            child: const Icon(
                              Icons.facebook_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: trentCentersDB.length,
                itemBuilder: (
                  BuildContext? context,
                  int? centerIndex,
                ) =>
                    Card(
                  child: ExpansionTile(
                    maintainState: true,
                    controller:
                        trentCentersDB[centerIndex!]!.expansionTileController,
                    onExpansionChanged: (
                      bool? isExpanded,
                    ) {},
                    title: Text(
                      trentCentersDB[centerIndex]!.trentCenterName!,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    leading: trentCentersDB[centerIndex]!
                                .otherTrentCenterCodes ==
                            null
                        ? Text(
                            trentCentersDB[centerIndex]!.trentCenterCode!,
                            style: const TextStyle(
                              fontSize: 9.0,
                            ),
                          )
                        : trentCentersDB[centerIndex]!
                                        .otherTrentCenterCodes!
                                        .length ==
                                    1 ||
                                trentCentersDB[centerIndex]!
                                        .otherTrentCenterCodes!
                                        .length ==
                                    2
                            ? SizedBox(
                                width: 24.0,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: trentCentersDB[centerIndex]!
                                          .otherTrentCenterCodes!
                                          .length +
                                      1,
                                  itemBuilder: (
                                    BuildContext? context,
                                    int? leadingIndex,
                                  ) =>
                                      Text(
                                    leadingIndex == 0
                                        ? trentCentersDB[centerIndex]!
                                            .trentCenterCode!
                                        : trentCentersDB[centerIndex]!
                                                .otherTrentCenterCodes![
                                            leadingIndex! - 1]!,
                                    style: const TextStyle(
                                      fontSize: 9.0,
                                    ),
                                  ),
                                ),
                              )
                            : (trentCentersDB[centerIndex]!
                                                .otherTrentCenterCodes!
                                                .length +
                                            1) %
                                        2 ==
                                    1
                                ? SizedBox(
                                    width: 28.0,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: (trentCentersDB[centerIndex]!
                                              .otherTrentCenterCodes!
                                              .length ~/
                                          2),
                                      itemBuilder: (
                                        BuildContext? context,
                                        int? leadingIndex,
                                      ) =>
                                          Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${leadingIndex == 0 ? trentCentersDB[centerIndex]!.trentCenterCode! : trentCentersDB[centerIndex]!.otherTrentCenterCodes![(leadingIndex! * 2) - 1]!} ${trentCentersDB[centerIndex]!.otherTrentCenterCodes![(leadingIndex!) * 2]!}",
                                            style: const TextStyle(
                                              fontSize: 8.0,
                                            ),
                                          ),
                                          if ((trentCentersDB[centerIndex]!
                                                      .otherTrentCenterCodes!
                                                      .length ~/
                                                  2) ==
                                              leadingIndex + 1)
                                            Text(
                                              trentCentersDB[centerIndex]!
                                                  .otherTrentCenterCodes!
                                                  .last!,
                                              style: const TextStyle(
                                                fontSize: 8.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: 28.0,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: trentCentersDB[centerIndex]!
                                              .otherTrentCenterCodes!
                                              .length ~/
                                          2,
                                      itemBuilder: (
                                        BuildContext? context,
                                        int? leadingIndex,
                                      ) =>
                                          Text(
                                        "${leadingIndex == 0 ? trentCentersDB[centerIndex]!.trentCenterCode! : trentCentersDB[centerIndex]!.otherTrentCenterCodes![(leadingIndex! * 2) - 1]!} ${trentCentersDB[centerIndex]!.otherTrentCenterCodes![(leadingIndex!) * 2]!}",
                                        style: const TextStyle(
                                          fontSize: 8.0,
                                        ),
                                      ),
                                    ),
                                  ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "View ${trentCentersDB[centerIndex]!.trentCenterName!}",
                        ),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                        ),
                        onTap: () async {
                          await Navigator.pushNamed(
                            context!,
                            "/center",
                            arguments: TrentCenterArguments(
                              centerIndex: centerIndex,
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        controller: ScrollController(),
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: trentCentersDB[centerIndex]!
                            .trentCenterFloors!
                            .length,
                        itemBuilder: (
                          BuildContext? context,
                          int? floorIndex,
                        ) =>
                            ExpansionTile(
                          maintainState: true,
                          controller: trentCentersDB[centerIndex]!
                              .trentCenterFloors![floorIndex!]!
                              .expansionTileController,
                          onExpansionChanged: (
                            bool? isExpanded,
                          ) {},
                          title: Text(
                            trentCentersDB[0]!
                                .trentCenterFloors![floorIndex]!
                                .floorName!,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                "View ${trentCentersDB[centerIndex]!.trentCenterFloors![floorIndex]!.floorName!}",
                              ),
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                              ),
                              onTap: () async {
                                await Navigator.pushNamed(
                                  context!,
                                  "/floor",
                                  arguments: TrentFloorArguments(
                                    centerIndex: centerIndex,
                                    floorIndex: floorIndex,
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: trentCentersDB[centerIndex]!
                                  .trentCenterFloors![floorIndex]!
                                  .rooms!
                                  .length,
                              itemBuilder: (
                                BuildContext? context,
                                int? roomIndex,
                              ) =>
                                  ListTile(
                                title: Text(
                                  trentCentersDB[centerIndex]!
                                      .trentCenterFloors![floorIndex]!
                                      .rooms![roomIndex!]!
                                      .roomNumber!,
                                ),
                                leading: Text(
                                  trentCentersDB[centerIndex]!
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
                                      centerIndex: centerIndex,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.settings_rounded,
                  ),
                  title: const Text(
                    "Settings",
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                  ),
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      "/settings",
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
    );
  }
}
