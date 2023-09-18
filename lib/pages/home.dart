import 'package:flutter/material.dart';

class TrentClassFindHome extends StatefulWidget {
  const TrentClassFindHome({
    super.key,
  });

  @override
  State<TrentClassFindHome> createState() => _TrentClassFindHomeState();
}

class _TrentClassFindHomeState extends State<TrentClassFindHome> {
  @override
  Widget build(
    BuildContext? context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context!,
        ).colorScheme.inversePrimary,
        title: const Text(
          'Trent University Class Find',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ZarBrush',
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
