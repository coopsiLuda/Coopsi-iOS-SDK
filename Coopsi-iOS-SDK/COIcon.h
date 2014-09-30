//
//  COIcon.h
//  Coopsi
//
//  Created by Luda Fux on 7/20/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COIcon : UIView 

@property (nonatomic, strong)   NSURL   *imageURL;
@property (nonatomic, strong)   UIImage *placeholderImage;
@property (nonatomic)           CGFloat radiusOfRoundedRect;

@end
