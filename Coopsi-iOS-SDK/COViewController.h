//
//  COViewController.h
//  Coopsi
//
//  Created by Luda Fux on 7/2/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COViewController : UIViewController

@property(nonatomic, strong) NSObject       *subject;

- (void) postSetSubject;
- (NSString*) epochNumOfMonthAgo:(int)months;

@end
