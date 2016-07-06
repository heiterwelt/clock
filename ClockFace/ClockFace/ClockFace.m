//
//  ClockFace.m
//  ClockFace
//
//  Created by Nick Lockwood on 28/04/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//

#import "ClockFace.h"


@interface ClockFace ()

//private properties
@property (nonatomic, strong) CAShapeLayer *hourHand;
@property (nonatomic, strong) CAShapeLayer *minuteHand;

@property(nonatomic,strong) CAShapeLayer *secondHand;
@end


@implementation ClockFace

- (id)init
{
    if ((self = [super init]))
    {
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        self.fillColor = [UIColor whiteColor].CGColor;
        self.strokeColor = [UIColor blackColor].CGColor;
        self.lineWidth = 4;
        
        self.hourHand = [CAShapeLayer layer];
        self.hourHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -80, 4, 80)].CGPath;
        
        self.hourHand.fillColor = [UIColor blackColor].CGColor;
        self.hourHand.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self addSublayer:self.hourHand];
        

        
        self.minuteHand = [CAShapeLayer layer];
        self.minuteHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-1, -90, 2, 90)].CGPath;
        self.minuteHand.fillColor = [UIColor blackColor].CGColor;
        self.minuteHand.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self addSublayer:self.minuteHand];
        
        
        self.secondHand = [CAShapeLayer layer];
        self.secondHand.path=[UIBezierPath bezierPathWithRect:CGRectMake(-1, -90, 1, 95)].CGPath;
        self.secondHand.fillColor=[UIColor blackColor].CGColor;
        self.secondHand.position=CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self addSublayer:self.secondHand];
        
    }
    return self;
}

- (void)setTime:(NSDate *)time
{
    _time = time;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit fromDate:time];
    self.hourHand.affineTransform = CGAffineTransformMakeRotation(components.hour / 12.0 * 2.0 * M_PI);
    self.minuteHand.affineTransform = CGAffineTransformMakeRotation(components.minute / 60.0 * 2.0 * M_PI);
    self.secondHand.affineTransform=CGAffineTransformMakeRotation(components.second/60.0*2.0*M_PI);
    
}
      
@end