import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:image/image.dart';
import 'package:test/test.dart';

void main() {
  group('Screenshots', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() => driver?.close());

    final locales = [
      'de-DE',
      'en-US',
      'mk-MK',
      'pl-PL',
      'ru-RU',
      'fr-FR',
    ];
    for (final locale in locales) {
      test(locale, () async {
        await driver.requestData('locale-$locale');
        await Future.delayed(const Duration(seconds: 2));

        await driver.tap(find.byValueKey('d-04'));

        final screenshot1 = await driver.screenshot();
        await _saveScreenshot(locale, '1', screenshot1);

        await driver.tap(find.byType('FloatingActionButton'));

        final screenshot2 = await driver.screenshot();
        await _saveScreenshot(locale, '2', screenshot2);

        await driver.tap(find.byValueKey('cancel-dialog'));
        await driver.tap(find.byType('ShoppingListBar'));

        final screenshot3 = await driver.screenshot();
        await _saveScreenshot(locale, '3', screenshot3);

        await _saveFeatureGraphic(
          locale,
          screenshot1: screenshot1,
          screenshot2: screenshot2,
          screenshot3: screenshot3,
        );
      }, timeout: const Timeout(Duration(minutes: 5)));
    }
  });
}

Future<void> _saveScreenshot(
  String locale,
  String name,
  List<int> bytes,
) async {
  final screenshot = decodePng(bytes);
  final screenshotFrame = decodePng(
    await File('assets/screenshot-frame.png').readAsBytes(),
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

Future<void> _saveFeatureGraphic(
  String locale, {
  List<int> screenshot1,
  List<int> screenshot2,
  List<int> screenshot3,
}) async {
  var image = Image(1024, 500);
  image = fill(image, getColor(0xFF, 0xC1, 0x07));

  final phoneFrame =
      decodePng(await File('assets/phone-frame.png').readAsBytes());
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
