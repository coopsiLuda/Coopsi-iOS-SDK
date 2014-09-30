//
//  COMissionsTableViewCell.h
//  Coopsi
//
//  Created by Luda Fux on 7/10/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COIcon.h"
#import "COCoopsiAmount.h"
#import "COTableViewCell.h"

@interface COMissionsTableViewCell : COTableViewCell
@property (weak, nonatomic) IBOutlet COIcon *missionIcon;
@property (weak, nonatomic) IBOutlet UILabel *missionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *missionDetailsLabel;
@property (weak, nonatomic) IBOutlet COCoopsiAmount *coopsiAmountLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topVertCont;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomVertConst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleVertConst;
@property (nonatomic)           BOOL isViewed;
@end
