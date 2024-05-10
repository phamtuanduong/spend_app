import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProvider {
  PathProvider._privateConstructor();

  static final PathProvider _instance = PathProvider._privateConstructor();

  static PathProvider get instance => _instance;

  Future<Directory?>? tempDirectory;
  Future<Directory?>? appSupportDirectory;
  Future<Directory?>? appLibraryDirectory;
  Future<Directory?>? appDocumentsDirectory;
  Future<Directory?>? externalDocumentsDirectory;
  Future<List<Directory>?>? externalStorageDirectories;
  Future<List<Directory>?>? externalCacheDirectories;

  void requestTempDirectory() async {
    tempDirectory = (await getTemporaryDirectory()) as Future<Directory?>?;
  }

  void requestAppDocumentsDirectory() async {
    appDocumentsDirectory =
        (await getApplicationDocumentsDirectory()) as Future<Directory?>?;
  }

  void requestAppSupportDirectory() async {
    appSupportDirectory =
        (await getApplicationSupportDirectory()) as Future<Directory?>?;
  }

  void requestAppLibraryDirectory() async {
    appLibraryDirectory = (await getLibraryDirectory()) as Future<Directory?>?;
  }

  Future<Directory?> requestExternalStorageDirectory() async {
    externalDocumentsDirectory =
        (await getExternalStorageDirectory()) as Future<Directory?>?;
    return externalDocumentsDirectory;
  }

  void requestExternalStorageDirectories(StorageDirectory type) async {
    externalStorageDirectories =
        (await getExternalStorageDirectories(type: type))
            as Future<List<Directory>?>?;
  }

  void requestExternalCacheDirectories() async {
    externalCacheDirectories =
        (await getExternalCacheDirectories()) as Future<List<Directory>?>?;
  }
}
