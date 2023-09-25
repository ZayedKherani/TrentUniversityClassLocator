import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glob/list_local_fs.dart';

import 'package:trent_u_class_find/services/image_file_service/image_file_service.dart';

import 'dart:convert';
import 'package:glob/glob.dart';

class DiskAssetBundle extends CachingAssetBundle {
  static const _assetManifestDotJson = 'AssetManifest.json';

  static Future<AssetBundle> loadGlob(
    Iterable<String> globs, {
    String from = 'assets',
  }) async {
    final cache = <String, ByteData>{};
    for (final pattern in globs) {
      await for (final path in Glob(
        pattern,
      ).list(
        root: from,
      )) {
        if (path is File) {
          final File tempFileVar = path as File;
          final bytes = await tempFileVar.readAsBytes();
          cache[path.path] = ByteData.view(
            bytes.buffer,
          );
        }
      }
    }

    final manifest = <String?, List<String?>?>{};

    cache.forEach(
      (
        key,
        _,
      ) {
        manifest[key] = [key];
      },
    );

    cache[_assetManifestDotJson] = ByteData.view(
      Uint8List.fromList(jsonEncode(manifest).codeUnits).buffer,
    );

    return DiskAssetBundle._(cache);
  }

  final Map<String, ByteData> _cache;

  DiskAssetBundle._(this._cache);

  @override
  Future<ByteData> load(String key) async {
    return _cache[key]!;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'getFileFromAssets',
    () {
      const assetPathForTest = 'assets/sample.txt';

      test(
        'assetPath',
        () async {
          final MockDirectory mockDirectory = MockDirectory();
          final MockFile mockFile = MockFile(
            path: assetPathForTest,
          );

          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(
            const MethodChannel(
              'plugins.flutter.io/path_provider',
            ),
            (
              MethodCall methodCall,
            ) async =>
                methodCall.method == 'getTemporaryDirectory'
                    ? mockDirectory
                    : null,
          );

          final File? result = await getFileFromAssets(
            assetPath: assetPathForTest,
            mockRootBundle: await DiskAssetBundle.loadGlob(
              [
                assetPathForTest,
              ],
              from: '',
            ),
            mockDirectory: mockDirectory,
            mockFile: mockFile,
          );

          expect(
            result,
            equals(
              mockFile,
            ),
          );
        },
      );
    },
  );

  group(
    'getFilePathFromAssets',
    () {
      const assetPathForTest = 'assets/sample.txt';

      test(
        'assetPath',
        () async {
          final MockDirectory mockDirectory = MockDirectory();
          final MockFile mockFile = MockFile(
            path: assetPathForTest,
          );

          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(
            const MethodChannel(
              'plugins.flutter.io/path_provider',
            ),
            (
              MethodCall methodCall,
            ) async =>
                methodCall.method == 'getTemporaryDirectory'
                    ? mockDirectory
                    : null,
          );

          final File? file = await getFileFromAssets(
            assetPath: assetPathForTest,
            mockRootBundle: await DiskAssetBundle.loadGlob(
              [
                assetPathForTest,
              ],
              from: '',
            ),
            mockDirectory: mockDirectory,
            mockFile: mockFile,
          );

          final String? result = await getFilePathFromAssets(
            file: file,
          );

          expect(
            result,
            equals(
              mockFile.path,
            ),
          );
        },
      );
    },
  );
}
