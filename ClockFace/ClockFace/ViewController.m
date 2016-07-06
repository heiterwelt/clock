//
//  ViewController.m
//  ClockFace
//
//  Created by Nick Lockwood on 28/04/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//

#import "ViewController.h"
#import "ClockFace.h"


@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) ClockFace *clockFace;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //add clock face layer
    self.clockFace = [[ClockFace alloc] init];
    self.clockFace.position = CGPointMake(self.view.bounds.size.width / 2, 150);
    [self.view.layer addSublayer:self.clockFace];
    
    //set default time
    self.clockFace.time = [NSDate date];
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(setTime)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (IBAction)setTime
{
    self.clockFace.time =[NSDate date] ;
 
//    self.clockFace.time = self.datePicker.date;
}

@end
