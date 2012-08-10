//
//  ViewController.m
//  PrayerDearGod
//
//  Created by iOS Camp on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *prayerFilePath = @"PrayerFile_";
    
    NSDate *currentDate = [NSDate date];

    NSDateComponents *currentDateComponents =
    [[NSCalendar currentCalendar] components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:currentDate];
        
   prayerFilePath =  [prayerFilePath stringByAppendingFormat:@"%d%02d%02d", [currentDateComponents year],[currentDateComponents month], [currentDateComponents day]];     
     
    //[currentDateComponents year],[currentDateComponents month], [currentDateComponents date]];
    
    NSLog(@"currentDateComponents: %@", currentDateComponents);
    
    NSLog(@"prayerFilePath: %@", prayerFilePath);

    NSString *stringPath = [[NSBundle mainBundle] pathForResource:prayerFilePath  ofType:@"html"];
    
    if (!stringPath) {
          stringPath = [[NSBundle mainBundle] pathForResource:@"PrayerFile_default"  ofType:@"html"];
    }
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:stringPath];
    
    
    
    NSURLRequest *prayerdeargod = [NSURLRequest requestWithURL:fileURL];
    
    [display loadRequest:prayerdeargod]; 
    
    
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
