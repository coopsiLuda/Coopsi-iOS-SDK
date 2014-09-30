//
//  COViewController.m
//  Coopsi
//
//  Created by Luda Fux on 7/2/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COViewController.h"
#import "COViewController.h"
//#import "CoModel.h"
//#import "STTableViewCell.h"
//#import <OHAttributedLabel/OHAttributedLabel.h>
//#import "STStock.h"
//#import "STUser.h"
//#import "STStockController.h"
//#import "STProfileViewController.h"
//#import "TSMiniWebBrowser.h"
//#import "STMyProfileViewController.h"

#define REFRESH_HEADER_HEIGHT 62

@implementation COViewController
@synthesize subject;

-(NSString*)epochNumOfMonthAgo:(int)months{
    NSDate *today = [NSDate date];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    NSDate *nextMonth = [gregorian dateByAddingComponents:components toDate:today options:0];
    
    NSDateComponents *nextMonthComponents = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:nextMonth];
    
    NSDateComponents *todayDayComponents = [gregorian components:NSDayCalendarUnit fromDate:today];
    
    nextMonthComponents.day = todayDayComponents.day;
    NSDate *requestedDate = [gregorian dateFromComponents:nextMonthComponents];
    NSString* requestedDateString = [NSString stringWithFormat:@"%f",floor([requestedDate timeIntervalSince1970] * 1000)];
    
    return requestedDateString;
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setSubject:(id)aSubjectData {
    @synchronized (self) {
        if (subject != aSubjectData) {
            subject = aSubjectData;
            [self postSetSubject];
        }
    }
}

- (void)postSetSubject {
    
}

-(NSUInteger)supportedInterfaceOrientations {

    return UIInterfaceOrientationMaskPortrait;
    
}

@end
