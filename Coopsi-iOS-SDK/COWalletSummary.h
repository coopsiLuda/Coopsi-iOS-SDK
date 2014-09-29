//
//  COGraphContainer.h
//  Coopsi
//
//  Created by Luda Fux on 7/17/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COWalletSummary : UIView
@property(weak, nonatomic)      IBOutlet UICollectionView *graphDates;
@property(weak, nonatomic)      IBOutlet UIView *topDelimiter;
@property(weak, nonatomic)      IBOutlet UIView *bottomDelimiter;
@property(weak, nonatomic)      IBOutlet UILabel *maxValueLabel;
@property(weak, nonatomic)      IBOutlet UILabel *minValueLabel;
@property(weak, nonatomic)      IBOutlet UILabel *todayAmount;
@property(weak, nonatomic)      IBOutlet UILabel *dailyAvgAmount;
@property(weak, nonatomic)      IBOutlet UIImageView *graphMockImage;
@property(nonatomic)            float dilimitersAlpha;

@end
