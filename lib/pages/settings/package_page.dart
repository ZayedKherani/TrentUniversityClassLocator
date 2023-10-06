import 'package:flutter/material.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({
    super.key,
    required this.packageName,
    required this.packageOccorrences,
    required this.paragraphs,
  });

  final String? packageName;
  final String? packageOccorrences;

  final List<List<String?>?>? paragraphs;

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  ScrollController? packagePageScrollController;

  @override
  void initState() {
    packagePageScrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    packagePageScrollController!.dispose();

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
              // controller: packagePageScrollController!,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 80.0,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          controller: packagePageScrollController!,
                          itemCount: widget.paragraphs!.length,
                          itemBuilder: (
                            BuildContext? context,
                            int? paragraphsIndex,
                          ) =>
                              Card(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Wrap(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    controller: ScrollController(),
                                    itemCount: widget
                                        .paragraphs![paragraphsIndex!]!.length,
                                    itemBuilder: (
                                      BuildContext? context,
                                      int? paragraphIndex,
                                    ) =>
                                        Text(
                                      widget.paragraphs![paragraphsIndex]![
                                          paragraphIndex!]!,
                                    ),
                                  ),
                                ],
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
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.packageName!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ZarBrush',
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      '${widget.packageOccorrences!} license${int.parse(widget.packageOccorrences!) == 1 ? '' : 's'}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ZarBrush',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
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
