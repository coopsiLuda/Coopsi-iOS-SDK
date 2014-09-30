//
//  COMissionsCompletedDS.m
//  Coopsi
//
//  Created by Luda Fux on 8/10/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COMissionsCompletedDS.h"
#import "COMissionsTableViewCell.h"

@implementation COMissionsCompletedDS


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"COMissionsTableViewCell";
    
    COMissionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    NSDictionary* objectProperties = self.dummyObjects[indexPath.row];
    cell.subject = objectProperties;
    
    return cell;
}


- (void)fetchData{
    
    if ([super isDummy]) {
        self.dummyObjects = [super arrayFromJson:@"CompletedMissions"];
        [self.delegate dataRefrashed];
    }else{
        [self.delegate dataRefrashed];
    }
}

@end
