import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Screenshots', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() => driver?.close());

    final locales = ['de', 'en', 'mk', 'pl'];
    for (final locale in locales) {
      test(locale, () async {
        driver.requestData('locale-$locale');
        await Future.delayed(const Duration(seconds: 2));
      });
    }
  });
}
