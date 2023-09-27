import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({
    super.key,
  });

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 80.0,
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(
                            10.0,
                          ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            "404",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ZarBrush',
                              fontSize: 34.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(
                            10.0,
                          ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            "The Page You Were Looking For Is Not Found",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ZarBrush',
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                            context!,
                            '/',
                          );
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(
                              10.0,
                            ),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              "Navigate To Home Page",
                            ),
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
                                  "Page Not Found",
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
