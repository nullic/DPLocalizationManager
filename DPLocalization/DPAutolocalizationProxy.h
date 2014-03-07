//
//  DPAutolocalizationProxy.h
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 07.03.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPAutolocalizationProxy : NSProxy <NSCopying>
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey;
+ (UIImage *)autolocalizingImageNamed:(NSString *)imageNamed;
@end
