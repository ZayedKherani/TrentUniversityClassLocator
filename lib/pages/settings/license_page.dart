import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trent_u_class_locator/models/license/license.dart';
import 'package:trent_u_class_locator/services/license_raw_conversion_service/license_raw_conversion_service.dart';
import 'package:trent_u_class_locator/universals/arguments.dart';
import 'package:trent_u_class_locator/widgets/network_asset_image.dart';

class TrentAppSettingsLicensePage extends StatefulWidget {
  const TrentAppSettingsLicensePage({
    super.key,
    required this.applicationVersion,
    required this.applicationLegalese,
    required this.applicationName,
    required this.applicationIconAssetPath,
  });

  final String? applicationVersion;
  final String? applicationLegalese;
  final String? applicationName;

  final String? applicationIconAssetPath;

  @override
  State<TrentAppSettingsLicensePage> createState() =>
      _TrentAppSettingsLicensePageState();
}

class _TrentAppSettingsLicensePageState
    extends State<TrentAppSettingsLicensePage> {
  ScrollController? licensesPageScrollController;

  @override
  void initState() {
    licensesPageScrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    licensesPageScrollController!.dispose();

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
              // controller: licensesPageScrollController!,
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
                          child: Center(
                            child: Text(
                              widget.applicationName!,
                              style: const TextStyle(
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
                            child: Image(
                              image: NetworkAssetImage(
                                assetPath: widget.applicationIconAssetPath!,
                              ).imageProvider!,
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
                                    child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          child: Center(
                            child: Text(
                              widget.applicationVersion!,
                              style: const TextStyle(
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
                          child: Center(
                            child: Text(
                              widget.applicationLegalese!,
                              style: const TextStyle(
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
                        const Card(
                          child: Center(
                            child: Text(
                              'Powered by Flutter',
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
                        FutureBuilder(
                          future: convertLicensesFuture(
                            LicenseRegistry.licenses.toList(),
                          ),
                          builder: (
                            BuildContext? context,
                            AsyncSnapshot<List<LicensePackage?>?>
                                convertedSnapshot,
                          ) {
                            if (!convertedSnapshot.hasData ||
                                convertedSnapshot.data == null ||
                                convertedSnapshot.data!.isEmpty) {
                              return Center(
                                child: CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(
                                      context!,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              );
                            } else if (convertedSnapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                controller: licensesPageScrollController!,
                                itemCount: convertedSnapshot.data!.length,
                                itemBuilder: (
                                  BuildContext? context,
                                  int? convertedSnapshotDataIndex,
                                ) =>
                                    Card(
                                  child: ListTile(
                                    title: Text(
                                      convertedSnapshot
                                          .data![convertedSnapshotDataIndex!]!
                                          .packageName!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ZarBrush',
                                        fontSize: 22,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${convertedSnapshot.data![convertedSnapshotDataIndex]!.packageOccorrences} license${convertedSnapshot.data![convertedSnapshotDataIndex]!.packageOccorrences == 1 ? '' : 's'}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ZarBrush',
                                        fontSize: 16,
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.white,
                                    ),
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                        context!,
                                        '/settings/licenses/package',
                                        arguments:
                                            TrentAppSettingsLicensePackagePageArguments(
                                          packageName: convertedSnapshot
                                              .data![
                                                  convertedSnapshotDataIndex]!
                                              .packageName,
                                          packageOccorrences: convertedSnapshot
                                              .data![
                                                  convertedSnapshotDataIndex]!
                                              .packageOccorrences
                                              .toString(),
                                          paragraphs: convertedSnapshot
                                              .data![
                                                  convertedSnapshotDataIndex]!
                                              .paragraphs,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }

                            return Center(
                              child: CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(
                                    context!,
                                  ).colorScheme.primary,
                                ),
                              ),
                            );
                          },
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
                              const Center(
                                child: Text(
                                  'Licenses',
                                  style: TextStyle(
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
                                ),
                              ),
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
