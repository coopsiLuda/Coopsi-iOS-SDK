//
//  CODataSourceRegistry.m
//  Coopsi
//
//  Created by Luda Fux on 7/28/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "CODataSourceRegistry.h"

@interface CODataSourceRegistry()
@property (nonatomic,strong) NSMutableDictionary *registry;
@end

@implementation CODataSourceRegistry

+ (CODataSourceRegistry *)sharedInstance {
    static CODataSourceRegistry *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[self alloc] init];
        });
    }
    return sharedInstance;
}


- (id)init
{
    if (self = [super init]) {
        self.registry = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (CODataSource*)dataSource:(NSString*)dataSourceName{
    Class dataSourceClass = NSClassFromString(dataSourceName);
    @synchronized(self) {
        
        CODataSource* result = [self.registry objectForKey:dataSourceClass];
        
        if (!result) {
            result = [[dataSourceClass alloc]init];
            [self.registry setObject:result forKey:dataSourceName];
        }

        return result;
    }
}

@end
