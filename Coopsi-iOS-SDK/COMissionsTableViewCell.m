//
//  COMissionsTableViewCell.m
//  Coopsi
//
//  Created by Luda Fux on 7/10/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COMissionsTableViewCell.h"

@interface COMissionsTableViewCell()
@property (nonatomic,strong) CAShapeLayer *isViewedBall;
@property (nonatomic,strong) NSLayoutConstraint *coopsiConstraintX;
@property (nonatomic,strong) NSLayoutConstraint *coopsiConstraintY;
@end

@implementation COMissionsTableViewCell

-(void)awakeFromNib{
    self.coopsiAmountLabel = [[NSBundle mainBundle] loadNibNamed:@"COCoopsiAmount" owner:self options:nil][0];
    
    [self.contentView addSubview:self.coopsiAmountLabel];
}


-(void)layoutSubviews{
    
    [self.coopsiAmountLabel layoutSubviews];
    
//    NSAttributedString *missionDetailsAttributedText = [[NSAttributedString alloc] initWithString:self.missionDetailsLabel.text attributes:@ { NSFontAttributeName: self.missionDetailsLabel.font }];
//    CGRect missionDetailsAttributedTextRect = [missionDetailsAttributedText boundingRectWithSize:(CGSize){self.missionDetailsLabel.width, CGFLOAT_MAX}
//                                                             options:NSStringDrawingUsesLineFragmentOrigin
//                                                             context:nil];
//    
//    CGFloat spaceForConstraints = self.height - missionDetailsAttributedTextRect.size.height - self.missionNameLabel.height;
//    self.topVertCont.constant = spaceForConstraints * 2/ 6;
//    self.middleVertConst.constant = spaceForConstraints *1 / 6;
//    self.bottomVertConst.constant = spaceForConstraints * 3 / 6;
//    
//    if (self.coopsiConstraintX) {
//        [self.contentView removeConstraint:self.coopsiConstraintX];
//    }
//    
//    if (self.coopsiConstraintY) {
//        [self.contentView removeConstraint:self.coopsiConstraintY];
//    }
//    
//    self.coopsiConstraintX = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.coopsiAmountLabel attribute:NSLayoutAttributeRight multiplier:1.0f constant:30.f];
//    
//    self.coopsiConstraintY = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.coopsiAmountLabel attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:00.f];
//    
//    [self.contentView addConstraint:self.coopsiConstraintX];
//    [self.contentView addConstraint:self.coopsiConstraintY];
//    
//    self.coopsiAmountLabel.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void)drawRect:(CGRect)rect{
    if (!self.isViewed) {
        int isViewedBallRadius = 4;
        self.isViewedBall = [CAShapeLayer layer];
        self.isViewedBall.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(6, 6, 2.0*isViewedBallRadius, 2.0*isViewedBallRadius)
                                                            cornerRadius:isViewedBallRadius].CGPath;
        self.isViewedBall.fillColor = [UIColor colorWithRed:111.0/255.0 green:194.0/255.0 blue:243.0/255.0 alpha:1.0].CGColor;
        [self.layer addSublayer:self.isViewedBall];
    }

}

-(void)postSetSubject{
//    [super postSetSubject];
//    NSDictionary* missionDic = (NSDictionary*)self.subject;
//    self.missionNameLabel.text = [missionDic objectForKey:@"title"];
//    self.missionDetailsLabel.text = [missionDic objectForKey:@"Conversion Point"];
//    self.coopsiAmountLabel.amountLabel.text = [NSString stringWithFormat:@"%d",[[missionDic objectForKey:@"amount"]intValue] ];
//    self.missionIcon.imageURL = [NSURL URLWithString:[missionDic objectForKey:@"imageUrl"]];
//    self.missionIcon.radiusOfRoundedRect = self.missionIcon.width/2;
//    if ([[missionDic objectForKey:@"isNew"]intValue] == 1) {
//        self.coopsiAmountLabel.gainLabel.text = @"G A I N";
//        self.isViewed = ([[missionDic objectForKey:@"isWatched"]intValue] == 1);
//    }else{
//        self.coopsiAmountLabel.gainLabel.text = @"G A I N E D";
//        self.isViewed = YES;
//    }
}

-(void)setIsViewed:(BOOL)isViewed{
    _isViewed = isViewed;
    if (isViewed) {
        [self.isViewedBall removeFromSuperlayer];
    }else{
        [self.layer addSublayer:self.isViewedBall];
    }
}

@end
