import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current = const $en();

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get apply => "Apply";

  String get attacking => "Attacking";

  String get button => "Button";

  String get chameleonMiniApp => "Chameleon Mini App";

  String get clear => "Clear";

  String get close => "Close";

  String get deviceInfo => "Device Info";

  String get disconnect => "Disconnect";

  String get download => "Download";

  String get downloading => "Downloading";

  String get effectiveAfterRestartingTheApp => "Effective after restarting app";

  String get english => "English";

  String get generalSetting => "General Setting";

  String get language => "Language";

  String get longPressButton => "Long Press Button";

  String get memorySize => "Memory Size";

  String get mfkey32 => "mfkey32";

  String get mode => "Mode";

  String get notAvailable => "N/A";

  String get refresh => "Refresh";

  String get reset => "Reset";

  String get selectLanguage => "Select Language";

  String get settings => "Settings";

  String get slot => "Slot";

  String get systemDefault => "System Default";

  String get traditionalChinese => "Traditional Chinese";

  String get uid => "UID";

  String get upload => "Upload";

  String get usbDeviceNotFound => "USB device not found";

  String get usbDisconnected => "USB Disconnected";
}

class $zh_TW extends S {
  const $zh_TW();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get usbDeviceNotFound => "找不到 USB 裝置";

  @override
  String get disconnect => "斷線";

  @override
  String get traditionalChinese => "正體中文";

  @override
  String get upload => "上傳";

  @override
  String get effectiveAfterRestartingTheApp => "重啟App後生效";

  @override
  String get language => "語言";

  @override
  String get slot => "槽位";

  @override
  String get notAvailable => "不可用";

  @override
  String get button => "按鈕";

  @override
  String get mode => "模式";

  @override
  String get systemDefault => "系統預設";

  @override
  String get uid => "UID";

  @override
  String get download => "下載";

  @override
  String get downloading => "下載中";

  @override
  String get english => "英文";

  @override
  String get usbDisconnected => "USB 已斷線";

  @override
  String get close => "關閉";

  @override
  String get selectLanguage => "選擇語言";

  @override
  String get settings => "設定";

  @override
  String get apply => "套用";

  @override
  String get clear => "清除";

  @override
  String get refresh => "刷新";

  @override
  String get mfkey32 => "解密";

  @override
  String get attacking => "解密中";

  @override
  String get deviceInfo => "裝置資訊";

  @override
  String get longPressButton => "長按按鈕";

  @override
  String get memorySize => "記憶體大小";

  @override
  String get reset => "重置";

  @override
  String get generalSetting => "一般設定";
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("zh", "TW"),
      Locale("en", ""),
    ];
  }

  LocaleListResolutionCallback listResolution(
      {Locale? fallback, bool withCountry = true}) {
    return (List<Locale>? locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale? fallback, bool withCountry = true}) {
    return (Locale? locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String? lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "zh_TW":
          S.current = const $zh_TW();
          return SynchronousFuture<S>(S.current);
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        default:
        // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale? locale, Locale? fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale? locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            supportedLocale.countryCode?.isEmpty != false) {
          return true;
        }
      }
    }
    return false;
  }
}

String? getLang(Locale? l) => l == null
    ? null
    : l.countryCode?.isEmpty != false
        ? l.languageCode
        : l.toString();
