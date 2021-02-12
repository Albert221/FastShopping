import 'dart:io';

import 'package:image/image.dart';

import 'screenshots/screenshots.dart';

void main() {
  final locales = Directory('fastlane/metadata/android')
      .listSync()
      .whereType<Directory>()
      .map((directory) => directory.path.split(RegExp(r'[/\\]')).last);

  takeScreenshots(
    locales: locales,
    onScreenshotTaken: _saveScreenshot,
    onThreeScreenshotsTaken: _saveFeaturedGraphic,
  );
}

Future<void> _saveScreenshot(
  String locale,
  String name,
  List<int> bytes,
) async {
  final screenshot = decodePng(bytes);
  final screenshotFrame = decodePng(
    await File('assets/android-screenshot-frame.png').readAsBytes(),
  );

  var image = Image(1944, 3456);
  image = drawImage(image, screenshot, dstX: 255, dstY: 743);
  image = drawImage(image, screenshotFrame);
  image = copyResize(
    image,
    width: 1080,
    height: 1920,
    interpolation: Interpolation.average,
  );

  final resultBytes = encodePng(image);

  final file = File(
      'fastlane/metadata/android/$locale/images/phoneScreenshots/$name.png');
  await file.create(recursive: true);
  await file.writeAsBytes(resultBytes);
}

Future<void> _saveFeaturedGraphic(
  String locale, {
  List<int> screenshot1,
  List<int> screenshot2,
  List<int> screenshot3,
}) async {
  var image = Image(1024, 500);
  image = fill(image, backgroundColor);

  final phoneFrame =
      decodePng(await File('assets/android-phone-frame.png').readAsBytes());
  final phoneFrameBlank = Image(1623, 3322);

  var first = drawImage(
    phoneFrameBlank,
    decodePng(screenshot1),
    dstX: 95,
    dstY: 223,
  );
  first = drawImage(first, phoneFrame);
  first = copyCrop(first, 0, 0, 1623, 2932);
  first = copyResize(
    first,
    width: 235,
    height: 424,
    interpolation: Interpolation.average,
  );
  image = drawImage(image, first, dstX: 70, dstY: 76);

  var second = drawImage(
    phoneFrameBlank,
    decodePng(screenshot2),
    dstX: 95,
    dstY: 223,
  );
  second = drawImage(second, phoneFrame);
  second = copyCrop(second, 0, 0, 1623, 2932);
  second = copyResize(
    second,
    width: 235,
    height: 424,
    interpolation: Interpolation.average,
  );
  image = drawImage(image, second, dstX: 396, dstY: 76);

  var third = drawImage(
    phoneFrameBlank,
    decodePng(screenshot3),
    dstX: 95,
    dstY: 223,
  );
  third = drawImage(third, phoneFrame);
  third = copyCrop(third, 0, 0, 1623, 2932);
  third = copyResize(
    third,
    width: 235,
    height: 424,
    interpolation: Interpolation.average,
  );
  image = drawImage(image, third, dstX: 718, dstY: 76);

  final resultBytes = encodePng(image);

  final file =
      File('fastlane/metadata/android/$locale/images/featureGraphic.png');
  await file.create(recursive: true);
  await file.writeAsBytes(resultBytes);
}
