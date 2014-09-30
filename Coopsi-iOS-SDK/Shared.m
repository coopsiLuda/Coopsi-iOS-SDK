//
//  Shared.m
//  Coopsi-iOS-SDK
//
//  Created by Luda Fux on 9/30/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//
#import "Shared.h"

@implementation Shared

static NSBundle * _myBundle;

+(NSBundle *)myBundle{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSBundle * mainBundle = [NSBundle mainBundle];
        NSString * pathToMyBundle = [mainBundle pathForResource:@"Coopsi" ofType:@"bundle"];
        
        NSAssert(pathToMyBundle, @"bundle not found", nil);
        
        _myBundle = [NSBundle bundleWithPath:pathToMyBundle];
    });
    
    return _myBundle;
}

+ (UIViewController*)viewControllerOf:(UIView*)view
{
    for (UIView* next = [view superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}

@end
