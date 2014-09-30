//
//  CODataSource.m
//  Coopsi
//
//  Created by Luda Fux on 8/14/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "CODataSource.h"

@implementation CODataSource
@synthesize subject;
- (id)init
{
    if (self = [super init]) {
        self.objects = [NSMutableOrderedSet orderedSet];
    }
    return self;
}

- (void)setSubject:(id)aSubjectData {
    @synchronized (self) {
        if (subject != aSubjectData) {
            subject = aSubjectData;
            [self postSetSubject];
        }
    }
}

- (void)postSetSubject {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dummyObjects count];
}

- (void)fetchData{
     [self.delegate dataRefrashed];
}

-(NSArray*)arrayFromJson:(NSString*)jsonName{
    NSString* path = [[Shared myBundle] pathForResource:jsonName
                                                     ofType:@"json"];
    NSString* jsonString = [NSString stringWithContentsOfFile:path
                                                     encoding:NSUTF8StringEncoding
                                                        error:NULL];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: jsonData options: NSJSONReadingMutableContainers error: &e];
    
    return jsonArray;

}

-(BOOL)isDummy{
    return YES;
}
@end
