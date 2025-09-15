# Country Data

A Flutter package that provides comprehensive country data including country codes, dial codes, and localized country names.

## Features

- **Complete Country Data**: Access to all countries with ISO codes, dial codes, and native names
- **Localization Support**: Country names in 40+ languages including Arabic, Chinese, French, German, Spanish, and many more
- **Type Safety**: Non-nullable fields ensure reliable data access
- **Easy Integration**: Simple API for country lookups and data retrieval

## Usage

### Basic Country Lookup

```dart
import 'package:country_data/country_data.dart';

// Get country by code
CountryCode country = CountryCode.fromCountryCode('US');
print(country.name); // "United States"
print(country.dialCode); // "+1"
print(country.code); // "US"

// Safe lookup that returns null if not found
CountryCode? country = CountryCode.tryFromCountryCode('XX');

// Get country by dial code
CountryCode country = CountryCode.fromDialCode('+44');
print(country.name); // "United Kingdom"
```

### Localization

```dart
// Localize country names based on context
CountryCode country = CountryCode.fromCountryCode('DE');
CountryCode localizedCountry = country.localize(context);
// Returns localized name based on app's current locale
```

### Available Data

Each `CountryCode` object contains:
- `name`: Country name (e.g., "United States", "Deutschland")
- `code`: ISO 2-letter country code (e.g., "US", "DE")
- `dialCode`: International dial code (e.g., "+1", "+49")

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  country_data: ^3.4.0
```

## Supported Languages

The package includes localization for 40+ languages:
Arabic, Azerbaijani, Belarusian, Bengali, Bulgarian, Bosnian, Catalan, Czech, Danish, German, Greek, English, Spanish, Estonian, Persian, Finnish, French, Galician, Hebrew, Hindi, Croatian, Hungarian, Armenian, Indonesian, Icelandic, Italian, Japanese, Georgian, Kazakh, Khmer, Korean, Kyrgyz, Lithuanian, Latvian, Macedonian, Mongolian, Malay, Norwegian, Dutch, Polish, Portuguese, Romanian, Russian, Slovak, Slovenian, Serbian, Swedish, Thai, Turkish, Ukrainian, Uzbek, Vietnamese, Chinese, and more.

## Version

Current version: 3.4.0