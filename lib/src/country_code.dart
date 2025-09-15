import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'country_codes.dart';
import 'country_localizations.dart';

mixin ToAlias {}

/// Country element. This is the element that contains all the information
class CountryCode {
  /// the name of the country
  String name;

  /// the country code (IT,AF..)
  final String code;

  /// the dial code (+39,+93..)
  final String dialCode;

  CountryCode({
    required this.name,
    required this.code,
    required this.dialCode,
  });

  factory CountryCode.fromCountryCode(String countryCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['code'] == countryCode,
    );
    return CountryCode.fromJson(jsonCode!);
  }

  static CountryCode? tryFromCountryCode(String countryCode) {
    try {
      return CountryCode.fromCountryCode(countryCode);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to recognize country from countryCode: $countryCode');
      }
      return null;
    }
  }

  factory CountryCode.fromDialCode(String dialCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
      (code) => code['dial_code'] == dialCode,
    );
    return CountryCode.fromJson(jsonCode!);
  }

  static CountryCode? tryFromDialCode(String dialCode) {
    try {
      return CountryCode.fromDialCode(dialCode);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to recognize country from dialCode: $dialCode');
      }
      return null;
    }
  }

  CountryCode localize(BuildContext context) {
    final nam = CountryLocalizations.of(context)?.translate(code) ?? name;
    return this..name = nam;
  }

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: json['name'] as String,
      code: json['code'] as String,
      dialCode: json['dial_code'] as String,
    );
  }

  @override
  String toString() => dialCode;

  String toLongString() => "$dialCode ${toCountryStringOnly()}";

  String toCountryStringOnly() {
    return _cleanName;
  }

  String get _cleanName {
    return name.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }
}
