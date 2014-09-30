//
//  COTableViewController.m
//  Coopsi
//
//  Created by Luda Fux on 8/14/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COTableViewController.h"
#import "CODataSourceRegistry.h"

@interface COTableViewController ()

@end

@implementation COTableViewController

- (void)setupDataSource:(NSString*)dataSourceName{
    self.dataSource = [[CODataSourceRegistry sharedInstance]dataSource:dataSourceName];
    self.dataSource.delegate = self;
    self.dataSource.table = self.table;
    
    self.table.delegate = self;
    self.table.dataSource = self.dataSource;
}

-(void)viewDidLoad{
//    
//    if (!self.tabBarController.tabBar.isHidden) {
//        UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.tabBarController.tabBar.height)];
//        self.table.tableFooterView = footerView;
//    }
    
}

-(void)dataRefrashed{
    [self.table reloadData];
    //in subclasses, call super and perform UI update
}


-(void)refresh{
    [self.dataSource fetchData];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    BOOL goingUp = NO;
    goingUp = scrollView.contentOffset.y > targetContentOffset->y ? YES : NO;
    goingUp = velocity.y > 0 ? NO : YES;
    
//    if (goingUp) {
//        [self setTabBarVisible:YES animated:YES];
//    }else{
//        [self setTabBarVisible:NO animated:YES];
//    }
}


- (void)setTabBarVisible:(BOOL)visible animated:(BOOL)animated {
    
    // bail if the current state matches the desired state
    if ([self tabBarIsVisible] == visible) return;
    
    // get a frame calculation ready
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat height = frame.size.height;
    CGFloat offsetY = (visible)? -height : height;
    
    // zero duration means no animation
    CGFloat duration = (animated)? 0.3 : 0.0;
    
    [UIView animateWithDuration:duration animations:^{
        self.tabBarController.tabBar.frame = CGRectOffset(frame, 0, offsetY);
        self.tabBarBlur.frame = CGRectOffset(frame, 0, offsetY);
        self.tabBarOverlay.frame = CGRectOffset(frame, 0, offsetY);
    }];
}

// know the current state
- (BOOL)tabBarIsVisible {
    return self.tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame);
}

@end
