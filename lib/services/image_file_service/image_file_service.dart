import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

// import 'dart:async';
import 'dart:io';

class MockRootBundle extends Mock implements AssetBundle {}

class MockDirectory extends Mock implements Directory {
  @override
  String get path => '/temp';

  MockDirectory();
}

class CustomMock extends Mock implements File {}

class MockFile extends CustomMock {
  String? _path;

  @override
  String get path => _path!;

  @override
  Future<File> create({
    bool? recursive = false,
    bool? exclusive = false,
  }) async {
    if (recursive == true) {
      return this;
    } else {
      return super.create(
        recursive: recursive!,
        exclusive: exclusive!,
      );
    }
  }

  MockFile({
    String? path,
  }) {
    _path = path;
  }
}

Future<String?>? getFilePathFromAssets({
  File? file,
}) async {
  return file!.path;
}

Future<File?>? getFileFromAssets({
  required String? assetPath,
  AssetBundle? mockRootBundle,
  MockDirectory? mockDirectory,
  MockFile? mockFile,
}) async {
  if (assetPath == null || assetPath.isEmpty) {
    return null;
  }

  ByteData? byteData;

  try {
    if (mockRootBundle != null) {
      // byteData = await mockRootBundle.load(
      //   assetPath,
      // );
    } else {
      byteData = await rootBundle.load(
        assetPath,
      );
    }
  } catch (e) {
    return null;
  }

  Directory temporaryDirectory;
  if (mockDirectory == null) {
    temporaryDirectory = await getTemporaryDirectory();
  } else {
    temporaryDirectory = mockDirectory;
  }

  final String temporaryDirectoryPath = temporaryDirectory.path;

  File file;
  if (mockFile == null) {
    file = File(
      '$temporaryDirectoryPath/$assetPath',
    );

    await file.create(
      recursive: true,
    );
  } else {
    file = mockFile;
  }

  if (byteData != null) {
    await file.writeAsBytes(
      byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ),
    );
  }

  return file;
}
