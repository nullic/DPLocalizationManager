//
//  DPLocalizationPlatforms.h
//  DP Commons
//
//  Created by Dmitriy Petrusevich on 17/02/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
#import <UIKit/UIKit.h>

#define DPLocalization_UIKit    1
#define DPLocalization_AppKit   0

#define DPColor UIColor
#define DPImage UIImage

#define DPFont UIFont
#define DPFontSymbolicTraits UIFontDescriptorSymbolicTraits
#define DPFontDescriptor UIFontDescriptor

#define DPFontTraitBold UIFontDescriptorTraitBold
#define DPFontTraitItalic UIFontDescriptorTraitItalic

#elif TARGET_OS_MAC
#import <AppKit/AppKit.h>

#define DPLocalization_UIKit    0
#define DPLocalization_AppKit   1

#define DPColor NSColor
#define DPImage NSImage

#define DPFont NSFont
#define DPFontSymbolicTraits NSFontSymbolicTraits
#define DPFontDescriptor NSFontDescriptor

#define DPFontTraitBold NSFontBoldTrait
#define DPFontTraitItalic NSFontItalicTrait

#endif