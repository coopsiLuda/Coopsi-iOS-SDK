//
//  COCoopsiAmount.h
//  Coopsi
//
//  Created by Luda Fux on 8/26/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COCoopsiAmount : UIView
@property (weak, nonatomic) IBOutlet UILabel *gainLabel;
@property (weak, nonatomic) IBOutlet UIView *delimiterView;
@property (weak, nonatomic) IBOutlet UIView *amountContainer;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coopsiImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *amountContainerWidth;


@end
