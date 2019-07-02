# DPLocalization CHANGELOG

## 1.13
- Added 'Swift Package Mannager' support 

## 1.12.1
- Fixed issue: Image localization don't use default bundle if language not selected

## 1.12
- Increase minimum iOS version to 8.0
- Fixed issue: ```-[DPLocalizationManager localizedImageNamed:]``` always return value from ```mainBundle``` instead of ```defaultBundle```.

## 1.11
- Added 'monospace' trait

## 1.10
- Added kern attribute
- Added linespacing attribute

## 1.9.3
- Use string from mainBundle if it was not found in default

## 1.9.1
- Fixed issue with paragraph style

## 1.9
- Added spacing attribute
- Added alignement attribute
- Added image replacer

## 1.8.3
- Added nullability
- Added Swift project example

## 1.8.2
- Fixed https://github.com/nullic/DPLocalizationManager/issues/10

## 1.8.1
- Added +[DPAutolocalizationProxy autolocalizingLocale]
- Added +[DPFormattedValue formattedValueWithValue: formatter: locale:]

## 1.8
- Fixed Set current language to 'nil' before reading
- Added defaultBundle property. ".strings" resources can be stored outside mainBundle.
- Added [DPLocalizationBundle class]

## 1.7
- Added Plural rules (NSNumber - integer only, DPFormattedNumberValue - decimal)
- Added -[DPLocalizationManager localizedStringForKey: table: arguments:]
- Added [DPFormattedValue class]
- Added -[UISegmentedControl autolocalizationPrefixKey]

## 1.6.2
- Fixed UITextView incorrect text alignment

## 1.6.1
- Fixed Set current language to 'nil' before reading
- Added 'Proxy object' now may be used as element od arguments array (see -[setupAutolocalizationWithKey: keyPath: arguments:])
- Added Support 'u' and 's' traits attribute for iOS < 7.0
- Added DPAutolocalizedStringFromTable(key, tableName, comment) function

## 1.6
- Added Multiple string tables support

## 1.5
- Added OS X support
- Added Attributed strings format (experemental)

## 1.4.2
- Swift support (macro -> "C" function)

## 1.4.1
- Added DPAutolocalizedString(key, comment) macro

## 1.4
- Added IBInspectable macro
- Bug fixes

## 1.3
- Added autolocalizationImageName property for UIImageView
- Added dp_get_language_display_name(lang) and dp_get_current_language_display_name() macros
- Added proxy objects around NSString and UIImage

## 1.2
- Added future for using localization with custom localization file

## 1.1
- Added ability to change language from application settings
- New methods: +[DPLocalizationManager supportedLanguages] and +[DPLocalizationManager preferredLanguage]

## 1.0
Initial release.
