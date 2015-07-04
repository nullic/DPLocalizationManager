//
//  DPFormattedValue.m
//  DP Commons
//
//  Created by Dmitriy Petrusevich on 30/06/15.
//  Copyright © 2015 Dmitriy Petrusevich. All rights reserved.
//

#import "DPFormattedValue.h"

@interface DPFormattedValue ()
@property (nonatomic, copy) NSFormatter *formatter;
@property (nonatomic, copy) id value;
@property (nonatomic, copy) NSString *formattedValue;
@end

@interface DPFormattedDateValue : DPFormattedValue
@property (nonatomic, copy) NSDateFormatter *formatter;
@property (nonatomic, copy) NSDate *value;
@end

@interface DPFormattedNumberValue : DPFormattedValue
@property (nonatomic, copy) NSNumberFormatter *formatter;
@property (nonatomic, copy) NSNumber *value;
@end

#pragma mark - DPFormattedValue

@implementation DPFormattedValue

+ (instancetype)formattedValueWithValue:(id)value formatter:(NSFormatter *)formatter {
    DPFormattedValue *result = nil;
    
    if ([value isKindOfClass:[NSNumber class]] && [formatter isKindOfClass:[NSNumberFormatter class]]) {
        result = [[DPFormattedNumberValue alloc] init];
        result.formatter = (NSNumberFormatter *)formatter;
        result.value = value;
    }
    else if ([value isKindOfClass:[NSDate class]] && [formatter isKindOfClass:[NSDateFormatter class]]) {
        result = [[DPFormattedDateValue alloc] init];
        result.formatter = (NSDateFormatter *)formatter;
        result.value = value;
    }
    else {
        result = [[self alloc] init];
        result.formatter = formatter;
        result.value = value;
    }
    
    return result;
}

- (NSString *)formattedValue {
    if (_formattedValue == nil) _formattedValue = [self.formatter stringForObjectValue:self.value];
    return _formattedValue;
}

- (NSString *)description {
    return self.formattedValue;
}

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    return [self description];
}

@end

#pragma mark - DPFormattedDateValue

@implementation DPFormattedDateValue

@dynamic value;
@dynamic formatter;

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    NSLocale *currentFormatterLocale = self.formatter.locale;

    self.formatter.locale = locale;
    NSString *result = [self.formatter stringForObjectValue:self.value];
    self.formatter.locale = currentFormatterLocale;

    return result;
}

@end

#pragma mark - DPFormattedNumberValue

@implementation DPFormattedNumberValue

@dynamic value;
@dynamic formatter;

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    NSLocale *currentFormatterLocale = self.formatter.locale;

    self.formatter.locale = locale;
    NSString *result = [self.formatter stringForObjectValue:self.value];
    self.formatter.locale = currentFormatterLocale;

    return result;
}

@end
