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
  );
}

Future<void> _saveScreenshot(
  String locale,
  String name,
  List<int> bytes,
) async {
  var screenshot = decodePng(bytes);
  final screenshotFrame = decodePng(
    await File('assets/iphone-screenshot-frame.png').readAsBytes(),
  );

  screenshot = copyResize(
    screenshot,
    width: 1006,
    height: 2174,
    interpolation: Interpolation.average,
  );

  // frame
  var image = Image(1284, 2778);
  image = fill(image, backgroundColor);
  image = drawImage(image, screenshot, dstX: 140, dstY: 458);
  image = drawImage(image, screenshotFrame);

  // iPhone 6.5"
  var resultBytes = encodePng(image);

  var file = File('fastlane/screenshots/$locale/iphone-65-$name.png');
  await file.create(recursive: true);
  await file.writeAsBytes(resultBytes);

  // iPhone 5.5"
  image = copyResize(
    image,
    width: 1021,
    height: 2208,
    interpolation: Interpolation.average,
  );

  var fiveAndHalfInchImage = Image(1242, 2208);
  fiveAndHalfInchImage = fill(fiveAndHalfInchImage, backgroundColor);
  fiveAndHalfInchImage =
      drawImage(fiveAndHalfInchImage, image, dstX: 110, dstY: 0);

  resultBytes = encodePng(fiveAndHalfInchImage);

  file = File('fastlane/screenshots/$locale/iphone-55-$name.png');
  await file.create(recursive: true);
  await file.writeAsBytes(resultBytes);
}
