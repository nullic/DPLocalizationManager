# DPLocalization

DPLocalization provide easy enough way to change localization inside application.


## Usage

###Dynamic localization

1. Use ```autolocalizationKey``` property in code or as **user defined runtime attribute** in xib:

```
	myLabel.autolocalizationKey = @"my_label_localization_key";
	myButton.autolocalizationKey = @"my_button_name";
```

2. Use ```-[setupAutolocalizationWithKey:keyPath:]``` or ```-[setupAutolocalizationWithKey:keyPath:arguments:]``` method of **NSObject**:

```
	[myLabel setupAutolocalizationWithKey:@"my_label_localization_key" keyPath:@"text"];
	[myLabel setupAutolocalizationWithKey:@"my_label_localization_template_key" keyPath:@"text" arguments:@[@"first", @"second"]];
```

Now after changing language (for example: ```dp_set_current_language(@"de")```) all objects, which was configured for dynamic localization, update their content.


###Static localization

For static localization select language (for example: ```dp_set_current_language(@"de")```) and use ```DPLocalizedString()``` macro in ```NSLocalizedString()``` maner.


###Proxy objects

Use **DPAutolocalizationProxy** class methods or their replacements.

```
    NSString *str = [NSString autolocalizingStringWithLocalizationKey:@"language"];

    dp_set_current_language(@"en");
    CFShow((__bridge CFTypeRef)(str));
    dp_set_current_language(@"ru");
    CFShow((__bridge CFTypeRef)(str));
```

Output example:
```
	English
	Russian
```


## Attributed strings

Some contols (since iOS 6) are support attributed values. You can specify attributes using special format (<**attributes**>{**string**}), it also reqire to set ```isAttributedKey``` property to ```YES```. Attributes will apply for string inside {}, other parts will use parameters specified by control. For example:
```
/* Localizable.strings */
"TITLE" = "English <color=12,56,189 size=12>{(en)}";
```
```
UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectZero];
myLabel.autolocalizationKey = @"TITLE";
myLabel.isAttributedKey = YES;
```
Will set ```attributedText``` property with string that can be described as:
```
English {
    NSColor = "UIDeviceWhiteColorSpace 0 1";
    NSFont = "<UICTFont: 0x79743450> font-family: \".HelveticaNeueInterface-Regular\"; font-weight: normal; font-style: normal; font-size: 17.00pt";
}(en){
    NSColor = "UIDeviceRGBColorSpace 0.0470588 0.219608 0.741176 1";
    NSFont = "<UICTFont: 0x79644cc0> font-family: \".HelveticaNeueInterface-Regular\"; font-weight: normal; font-style: normal; font-size: 12.00pt";
}
```

### Avalible attributes:
* **font** - set font name - ```<font=\"Courier-BoldOblique\">{string}```
* **size** - set font size - ```<size=12.0>{string}``` or ```<size=12>{string}```
* **color** - set text color in RGB or RGBA format - ```<color=12,56,189>{string}``` or ```<size=12,56,189,255>{string}```
* **traits** - set font traits: **b** (bold), **i** (italic); and text attributes **u** (underline), **s** (strikethrough); **!** used for remove attibute - ```<traits=b>{string}``` or ```<traits=!b>{string}```
* **link** - set link attribute - ```<link=\"https://github.com/nullic/DPLocalizationManager\">{link to DPLocalizationManager}```


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
