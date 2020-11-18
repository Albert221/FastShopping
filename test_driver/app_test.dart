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

    final locales = ['de-DE', 'en-US', 'mk-MK', 'pl-PL'];
    for (final locale in locales) {
      test(locale, () async {
        await driver.requestData('locale-$locale');
        await Future.delayed(const Duration(seconds: 2));
        await driver
            .tap(find.byValueKey('21827905-af88-4ff2-88a1-490e40d835d8'));
        await _saveScreenshot(locale, '1', driver.screenshot());
        await driver.tap(find.byType('FloatingActionButton'));
        await _saveScreenshot(locale, '2', driver.screenshot());
        await driver.tap(find.byValueKey('add_item_back'));
        await driver.tap(find.byType('_BottomAppBar'));
        await _saveScreenshot(locale, '3', driver.screenshot());
      });
    }
  });
}

Future<void> _saveScreenshot(
  String locale,
  String name,
  Future<List<int>> bytes,
) async {
  final screenshot = decodePng(await bytes);
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
    interpolation: Interpolation.cubic,
  );

  final resultBytes = encodePng(image);

  final file =
      File('metadata/android/$locale/images/phoneScreenshots/$name.png');
  await file.create(recursive: true);
  await file.writeAsBytes(resultBytes);
}
