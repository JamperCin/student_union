//import 'package:http/http.dart' as http;
//import 'package:core_module/core_module.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class ShareFileUtils {
  static final ShareFileUtils _instance = ShareFileUtils._();
  static ShareFileUtils get instance => _instance;

  ShareFileUtils._();

  factory ShareFileUtils() => _instance;

  //Download image from url, save to gallery and share
  Future<void> saveAndShareImage({
    required String imageUrl,
    String? title,
  }) async {
    try {
      // 1. Ask for permission (Android only)
      // final status = await Permission.photos.request();
      // if (!status.isGranted) {
      //   debugPrint("Permission denied");
      //   //return;
      // }

      // 2. Download image
      var response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // 3. Save to gallery
      final imageBytes = Uint8List.fromList(response.data);
      final result = await ImageGallerySaverPlus.saveImage(
        imageBytes,
        quality: 60,
        name: "shared_image_${DateTime.now().millisecondsSinceEpoch}",
      );
      debugPrint("  Image saved to gallery: ${result.toString()}");

      // 4. Save temporary file for sharing
      final tempDir = await getTemporaryDirectory();
      final file = File("${tempDir.path}/share_image.jpg");
      await file.writeAsBytes(imageBytes);

      // 5. Share
      await shareFileFromPath(filePath: file.path, title: title);

      // 6. Delete temporary file
      await file.delete();
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  //Share File from local path
  Future<void> shareFileFromPath({
    required String filePath,
    String? title,
  }) async {
    try {
      final file = File(filePath);
      if (!file.existsSync()) {
        debugPrint("File does not exist at path: $filePath");

        ///Users/aninamankwah/Library/Developer/CoreSimulator/Devices/5132B576-FBC4-49AD-B62C-87CEAB767173/data/Containers/Data/Application/84CC3E58-BA7A-45D2-BA54-8DDB17EB4F64/Library/Caches/share_image.jpg
        return; // or throw an error
      }

      final params = ShareParams(
        text: title ?? "SU Ghana App",
        files: [XFile(filePath)],
      );

      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        debugPrint('Thank you for sharing the picture!');
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
