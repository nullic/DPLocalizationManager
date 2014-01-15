# DPLocalization

DPLocalization provide easy enough way to change localization inside application.


## Usage

###Dynamic localization

1. Use ```autolocalizationKey``` property in code or as **user defined runtime attribute** in xib:

```
	myLabel.autolocalizationKey = @"my_label_localization_key";
	myButton.autolocalizationKey = @"my_button_name";
```

2. Use ```-[setupAutolocalizationWithKey:keyPath:]``` or ```-[setupAutolocalizationWithKey:keyPath:arguments:]``` method of NSObject:

```
	[myLabel setupAutolocalizationWithKey:@"my_label_localization_key" keyPath:@"text"];
	[myLabel setupAutolocalizationWithKey:@"my_label_localization_template_key" keyPath:@"text" arguments:@[@"first", @"second"]];
```

Now after changing language (for example: ```dp_set_current_language(@"de")```) all objects, which was configured for dynamic localization, update their content.


###Static localization

For static localization select language (for example: ```dp_set_current_language(@"de")```) and use ```DPLocalizedString()``` macro in ```NSLocalizedString()``` maner.


## Installation

DPLocalization is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "DPLocalization"


## Localization check

dpstrings.py it is Python script, that used for checking most common usage of library. It's scan {some} folder for sources and resoures and make validation  for common errors (missing keys, duplication).

Usage example: **python dpstrings.py -p "MyProjectPath" -l "en;ru;"**.<br/>
For more information: **python dpstrings.py --help**.


## License

DPLocalization is available under the MIT license. See the LICENSE file for more info.

