//
//  COTableViewCell.h
//  Coopsi
//
//  Created by Luda Fux on 9/2/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COTableViewCell : UITableViewCell

@property(nonatomic, strong) NSObject       *subject;
- (void)postSetSubject;
@end
