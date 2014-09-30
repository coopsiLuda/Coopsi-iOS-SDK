//
//  CODataSource.h
//  Coopsi
//
//  Created by Luda Fux on 8/14/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "COModel.h"
#import "Shared.h"


@protocol CODataSourceDelegate;


@interface CODataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong)   NSObject* subject;
@property (nonatomic, weak)     UITableView* table;
@property (nonatomic, weak)     id<CODataSourceDelegate> delegate;
@property (nonatomic, strong)   NSMutableOrderedSet *objects;
@property (nonatomic, strong)   NSArray *dummyObjects;

-(void)fetchData;
-(NSArray*)arrayFromJson:(NSString*)jsonName;
-(BOOL)isDummy;
- (void) postSetSubject;

@end


@protocol CODataSourceDelegate <NSObject>

- (void)dataRefrashed;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender;

@end

