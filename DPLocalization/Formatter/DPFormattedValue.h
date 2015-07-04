//
//  DPFormattedValue.h
//  DP Commons
//
//  Created by Dmitriy Petrusevich on 30/06/15.
//  Copyright © 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPFormattedValue : NSObject
+ (instancetype)formattedValueWithValue:(id)value formatter:(NSFormatter *)formatter;

- (id)value;
- (NSFormatter *)formatter;
- (NSString *)formattedValue;

- (NSString *)description;
- (NSString *)descriptionWithLocale:(NSLocale *)locale;
@end
