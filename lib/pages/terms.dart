import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({
    super.key,
  });

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(
                                  10.0,
                                ),
                                child: Wrap(
                                  children: [
                                    Text(
                                      """Effective September 27th, 2023

1. Acceptance of Terms
By using The Trent University Class Find App and accessing the website [https://zayedkherani.github.io/TrentUniversityClassLocator/], you agree to comply with and be bound by the following legally binding terms and conditions ("Terms"). If you do not agree to these Terms, please do not use The Trent University Class Find App.

2. Use of Images
All images provided within The Trent University Class Find App and on the website [https://zayedkherani.github.io/TrentUniversityClassLocator/] are for personal use only. You are permitted to use these images for personal, non-commercial purposes. Any other use, including but not limited to reproduction, distribution, modification, or public display, is prohibited without the express written consent of the respective copyright owners.

3. Ownership of Trent University Logo
The Trent University logo is the intellectual property of Trent University and its respective owners. The use of the Trent University logo within The Trent University Class Find App and on the website [https://zayedkherani.github.io/TrentUniversityClassLocator/] does not grant any ownership or rights to the logo. All rights and ownership of the Trent University logo remain with Trent University and its respective institutions.

4. Liability
The owner of The Trent University Class Find App, represented by the entity that owns the GitHub repository, and associated entities shall not be held liable for any damages or losses incurred while using the app or visiting the website [https://zayedkherani.github.io/TrentUniversityClassLocator/]. Users are solely responsible for their use of The Trent University Class Find App and any consequences that may arise from such use.

5. Changes to Terms
The owner of The Trent University Class Find App, represented by the entity that owns the GitHub repository, reserves the right to modify or revise these legally binding Terms at any time. Your continued use of The Trent University Class Find App and the website [https://zayedkherani.github.io/TrentUniversityClassLocator/] after any such changes are made constitutes your legally binding acceptance of the new Terms.
""",
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
                                  const Center(
                                    child: Text(
                                      'Terms and Conditions',
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
          ],
        ),
      ),
    );
  }
}
