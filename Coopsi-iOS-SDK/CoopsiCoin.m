//
//  CoopsiCoin.m
//  Coopsi-iOS-SDK
//
//  Created by Luda Fux on 9/23/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "CoopsiCoin.h"

@implementation CoopsiCoin

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor redColor];
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
    self.backgroundColor = [UIColor redColor];
    UIImage *image = [UIImage imageNamed:@"Coopsi.bundle/CoopsiCoin"];
 
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(showWallet)
     forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self addSubview:button];
    
//    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
//    [self addSubview:imageView];
}

-(void)showWallet{
    
}

@end
