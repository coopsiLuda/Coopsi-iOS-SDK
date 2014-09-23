//
//  CoopsiCoin.m
//  Coopsi-iOS-SDK
//
//  Created by Luda Fux on 9/23/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "CoopsiCoin.h"
#import "WalletViewController.h"

@implementation CoopsiCoin

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initFunction];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initFunction];
    }
    return self;
}

-(void)initFunction{
    UIImage *image = [UIImage imageNamed:@"Coopsi.bundle/CoopsiCoin"];
 
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(showWallet)
     forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 160.0, 40.0);
    [self addSubview:button];
    
//    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
//    [self addSubview:imageView];
}

-(void)showWallet{
    WalletViewController *viewController = [[WalletViewController alloc] init];
    UIViewController* topMostVC = [self viewController];
    [topMostVC presentViewController:viewController animated:YES completion:nil];
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
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
