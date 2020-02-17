import 'dart:async';
import 'dart:convert';

import 'package:fast_shopping/utils/waitgroup.dart';
import 'package:flutter/services.dart' show rootBundle;

class FastShoppingI18n {
  static final FastShoppingI18n _singleton = FastShoppingI18n._();

  final Map<String, Map<String, String>> _messages = {};
  Set<String> _preferredLocales;

  factory FastShoppingI18n() => _singleton;
  FastShoppingI18n._();

  Future<void> init([Set<String> preferredLocales = const {'en_US'}]) async {
    _preferredLocales = preferredLocales..add('en_US');

    final waitGroup = WaitGroup()..add(_preferredLocales.length);
    _preferredLocales.forEach((locale) async {
      try {
        final json = await rootBundle.loadString('lib/i18n/$locale.json');
        _messages[locale] = Map<String, String>.from(jsonDecode(json));
      } finally {
        waitGroup.done();
      }
    });
    await waitGroup.wait();
  }

  String message(String key) {
    for (var locale in _preferredLocales) {
      if (_messages.containsKey(locale) && _messages[locale].containsKey(key)) {
        return _messages[locale][key];
      }
    }

    return '404 $key';
  }
}
