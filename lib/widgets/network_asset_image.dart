import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetworkAssetImage extends StatefulWidget {
  const NetworkAssetImage({
    super.key,
    required this.assetPath,
    this.width,
  });

  final String? assetPath;
  final double? width;

  @override
  State<NetworkAssetImage> createState() => _NetworkAssetImageState();
}

class _NetworkAssetImageState extends State<NetworkAssetImage> {
  Future<bool> _isAssetLoaded(
    String? assetPath,
  ) async {
    try {
      await rootBundle.load(
        assetPath!,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Image imageBuilder({
    ImageProvider? imageProvider,
  }) =>
      Image(
        image: imageProvider!,
        width: widget.width,
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
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(
                    context,
                  ).colorScheme.onSurface,
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
      );

  @override
  Widget build(
    BuildContext? context,
  ) {
    if (widget.assetPath == null) {
      return const Text(
        "ERROR: NO ASSET PATH PROVIDED",
      );
    }

    return FutureBuilder<bool>(
      future: _isAssetLoaded(
        widget.assetPath!,
      ),
      builder: (
        BuildContext? context,
        AsyncSnapshot? snapshot,
      ) {
        if (snapshot!.connectionState == ConnectionState.waiting ||
            snapshot.hasError ||
            !snapshot.data! ||
            snapshot.data == null ||
            !snapshot.hasData) {
          return imageBuilder(
            imageProvider: NetworkImage(
              "https://zayedkherani.github.io/TrentUniversityClassLocator/assets/${widget.assetPath!}",
            ),
          );
        }

        return imageBuilder(
          imageProvider: AssetImage(
            widget.assetPath!,
          ),
        );
      },
    );
  }
}
