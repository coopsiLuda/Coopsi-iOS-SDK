//
//  COGraphContainer.m
//  Coopsi
//
//  Created by Luda Fux on 7/17/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COGraphContainer.h"


@interface COGraphContainer()

@property (strong, nonatomic)   UIBezierPath *aPath;
@property (strong, nonatomic)   CAShapeLayer *maskLayer;

@end




@implementation COGraphContainer

-(void)awakeFromNib{
    self.dilimitersAlpha = self.bottomDelimiter.alpha;
}

- (void)drawRect:(CGRect)rect
{
    if (!self.maskLayer) {
        self.maskLayer = [CAShapeLayer layer];
        self.maskLayer.fillColor = [[UIColor colorWithWhite:0 alpha:0.19]CGColor];
        [self.layer insertSublayer:self.maskLayer atIndex:0];
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews{
    if (!self.maskLayer) {
        [self setNeedsDisplay];
    }
    self.maskLayer.path = [self getBackgroundlePath];
    [super layoutSubviews];
}

-(CGPathRef)getBackgroundlePath
{
    return [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:7.5] CGPath];
}

@end
