//
//  NSDate+HowLong.h
//  HowLongCategory
//
//  Created by Allan Alves on 7/30/15.
//  Copyright (c) 2015 Allan Alves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HowLong)

- (NSString*) howLongDescription;

- (NSNumber*) howLongSeconds;
- (NSNumber*) howLongMinutes;
- (NSNumber*) howLongHours;
- (NSNumber*) howLongDays;
- (NSNumber*) howLongWeeks;
- (NSNumber*) howLongMonths;
- (NSNumber*) howLongYears;

@end
