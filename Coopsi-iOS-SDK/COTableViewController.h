//
//  COTableViewController.h
//  Coopsi
//
//  Created by Luda Fux on 8/14/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COViewController.h"
#import "CODataSource.h"

@interface COTableViewController : COViewController <CODataSourceDelegate,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) IBOutlet UITableView* table;
@property (nonatomic,strong) IBOutlet UIView* tabBarBlur;
@property (nonatomic,strong) IBOutlet UIView* tabBarOverlay;
@property (nonatomic,strong) CODataSource *dataSource;

- (void)setupDataSource:(NSString*)dataSourceName;
- (void)refresh;

@end
