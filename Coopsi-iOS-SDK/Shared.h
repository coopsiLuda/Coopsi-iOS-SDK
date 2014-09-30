//
//  Shared.h
//  Coopsi-iOS-SDK
//
//  Created by Luda Fux on 9/30/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Shared : NSObject
+ (NSBundle *)myBundle;
+ (UIViewController*)viewControllerOf:(UIView*)view;
@end
