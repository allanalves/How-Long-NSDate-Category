//
//  NSDate+HowLong.m
//  HowLongCategory
//
//  Created by Allan Alves on 7/30/15.
//  Copyright (c) 2015 Allan Alves. All rights reserved.
//

#import "NSDate+HowLong.h"

@implementation NSDate (HowLong)

- (NSString*) howLongDescription {
    long seconds = [self howLongSeconds].longValue;
    
    if (seconds <= 30) { //if less than 30 seconds
        return NSLocalizedString(@"right now", nil);
    } else {
        NSCalendarUnit units =
        kCFCalendarUnitSecond |
        kCFCalendarUnitMinute |
        kCFCalendarUnitHour   |
        kCFCalendarUnitDay    |
        kCFCalendarUnitWeekOfYear   |
        kCFCalendarUnitMonth  |
        kCFCalendarUnitYear;
        
        // if `date` is before "now" (i.e. in the past) then the components will be positive
        NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                       fromDate:self
                                                                         toDate:[NSDate date]
                                                                        options:0];
        
        if (components.year > 0) {
            return [self stringCheckPluralWithValue:components.year
                                          andString:NSLocalizedString(@"year", nil)];
        } else if (components.month > 0) {
            return [self stringCheckPluralWithValue:components.month
                                          andString:NSLocalizedString(@"month", nil)];
        } else if (components.weekOfYear > 0) {
            return [self stringCheckPluralWithValue:components.weekOfYear
                                          andString:NSLocalizedString(@"week", nil)];
        } else if (components.day > 0) {
            if (components.day > 1) {
                return [self stringCheckPluralWithValue:components.day
                                              andString:NSLocalizedString(@"day", nil)];
            } else return NSLocalizedString(@"yesterday", nil); //if 1 day ago
        } else if (components.hour > 0) {
            return [self stringCheckPluralWithValue:components.hour
                                          andString:NSLocalizedString(@"hour", nil)];
        } else if (components.minute > 0) {
            return [self stringCheckPluralWithValue:components.minute
                                          andString:NSLocalizedString(@"minute", nil)];
        } else if (components.second > 0) {
            return [self stringCheckPluralWithValue:components.second
                                          andString:NSLocalizedString(@"second", nil)];
        }
    }
    
    return nil;
}

- (NSString*) stringCheckPluralWithValue:(long)value andString:(NSString*)string {
    if (value > 1) {
        string = [string stringByAppendingString:@"s"];
    }
    return [NSString stringWithFormat:@"%@ %@", @(value), string];
}

- (NSNumber*) howLongSeconds {
    long nowTimestamp = [[NSDate date] timeIntervalSince1970];
    long timestamp = [self timeIntervalSince1970];
    return @(nowTimestamp - timestamp);
}

- (NSNumber*) howLongMinutes {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60);
}

- (NSNumber*) howLongHours {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60/60);
}

- (NSNumber*) howLongDays {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60/60/24);
}

- (NSNumber*) howLongWeeks {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60/60/24/7);
}

- (NSNumber*) howLongMonths {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60/60/24/12);
}

- (NSNumber*) howLongYears {
    long seconds = [self howLongSeconds].longValue;
    return @(seconds/60/60/24/365);
}

@end
