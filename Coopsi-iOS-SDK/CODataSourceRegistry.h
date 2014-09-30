//
//  CODataSourceRegistry.h
//  Coopsi
//
//  Created by Luda Fux on 7/28/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CODataSource.h"

@interface CODataSourceRegistry : NSObject

- (CODataSource*)dataSource:(NSString*)dataSourceName;

+ (CODataSourceRegistry *)sharedInstance;

@end
