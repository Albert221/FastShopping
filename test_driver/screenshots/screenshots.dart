import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:image/image.dart';
import 'package:test/test.dart';

typedef OnScreenshotTaken = Future<void> Function(
  String locale,
  String name,
  List<int> bytes,
);

typedef OnThreeScreenshotsTaken = Future<void> Function(
  String locale, {
  List<int> screenshot1,
  List<int> screenshot2,
  List<int> screenshot3,
});

final backgroundColor = getColor(0xFF, 0xC1, 0x07);

void takeScreenshots({
  Iterable<String> locales = const [],
  OnScreenshotTaken onScreenshotTaken,
  OnThreeScreenshotsTaken onThreeScreenshotsTaken,
}) {
  group('Screenshots', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() => driver?.close());

    for (final locale in locales) {
      test(locale, () async {
        await driver.requestData('locale-$locale');
        await Future.delayed(const Duration(seconds: 2));

        await driver.tap(find.byValueKey('d-04'));

        final screenshotItems = await _takeScreenshot();
        await onScreenshotTaken(locale, '1', screenshotItems);

        await driver.tap(find.byType('FloatingActionButton'));

        final screenshotAddItem = await _takeScreenshot();
        await onScreenshotTaken(locale, '2', screenshotAddItem);

        await driver.tap(find.byValueKey('cancel-dialog'));
        await driver.tap(find.byType('ShoppingListBar'));

        final screenshotShoppingLists = await _takeScreenshot();
        await onScreenshotTaken(locale, '3', screenshotShoppingLists);

        await onThreeScreenshotsTaken(
          locale,
          screenshot1: screenshotItems,
          screenshot2: screenshotAddItem,
          screenshot3: screenshotShoppingLists,
        );

        await driver.tap(find.byValueKey('lists-back'));
        await driver.tap(find.byValueKey('menu'));
        await driver.tap(find.byValueKey('settings'));
        await driver.tap(find.byValueKey('dark-theme'));
        await driver.tap(find.byValueKey('dark-theme-0'));
        await driver.tap(find.byValueKey('settings-back'));

        final screenshotDarkTheme = await _takeScreenshot();
        await onScreenshotTaken(locale, '4', screenshotDarkTheme);
      }, timeout: const Timeout(Duration(minutes: 5)));
    }
  });
}

Future<List<int>> _takeScreenshot() async {
  await Process.run('flutter', ['screenshot']);
  final file = File('flutter_01.png');
  final bytes = await file.readAsBytes();
  await file.delete();

  return bytes;
}
