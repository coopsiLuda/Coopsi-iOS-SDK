//
//  COTableViewCell.m
//  Coopsi
//
//  Created by Luda Fux on 9/2/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COTableViewCell.h"

@implementation COTableViewCell
@synthesize subject;



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

-(void)prepareForReuse{
    self.subject = nil;
    [self setNeedsDisplay];
}
@end
