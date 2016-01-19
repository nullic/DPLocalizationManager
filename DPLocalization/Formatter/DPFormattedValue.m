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
@property (nonatomic, copy) NSLocale *locale;
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
    return [self formattedValueWithValue:value formatter:formatter locale:nil];
}

+ (instancetype)formattedValueWithValue:(id)value formatter:(NSFormatter *)formatter locale:(NSLocale *)locale {
    DPFormattedValue *result = nil;
    
    if ([value isKindOfClass:[NSNumber class]] && [formatter isKindOfClass:[NSNumberFormatter class]]) {
        result = [[DPFormattedNumberValue alloc] init];
    }
    else if ([value isKindOfClass:[NSDate class]] && [formatter isKindOfClass:[NSDateFormatter class]]) {
        result = [[DPFormattedDateValue alloc] init];
    }
    else {
        result = [[self alloc] init];
    }

    result.formatter = formatter;
    result.value = value;
    result.locale = locale;

    return result;
}

- (NSString *)formattedValue {
    if (_formattedValue == nil) _formattedValue = [self.formatter stringForObjectValue:self.value];
    return _formattedValue;
}

- (NSString *)description {
    return [self descriptionWithLocale:self.locale];
}

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    return self.formattedValue;
}

@end

#pragma mark - DPFormattedDateValue

@implementation DPFormattedDateValue

@dynamic value;
@dynamic formatter;

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    if (locale == nil) {
        return [super descriptionWithLocale:locale];
    }
    else {
        NSLocale *currentFormatterLocale = self.formatter.locale;

        self.formatter.locale = locale;
        NSString *result = [self.formatter stringForObjectValue:self.value];
        self.formatter.locale = currentFormatterLocale;

        return result;
    }
}

@end

#pragma mark - DPFormattedNumberValue

@implementation DPFormattedNumberValue

@dynamic value;
@dynamic formatter;

- (NSString *)descriptionWithLocale:(NSLocale *)locale {
    if (locale == nil) {
        return [super descriptionWithLocale:locale];
    }
    else {
        NSLocale *currentFormatterLocale = self.formatter.locale;

        self.formatter.locale = locale;
        NSString *result = [self.formatter stringForObjectValue:self.value];
        self.formatter.locale = currentFormatterLocale;

        return result;
    }
}

@end
