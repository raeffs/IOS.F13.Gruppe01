//
//  CNFFact.m
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import "CNFFact.h"

@implementation CNFFact

- (id) initWithId:(int)factId title:(NSString*)title body:(NSString*)body andIsFactOfTheDay:(BOOL)isFactOfTheDay
{
    if (self = [self init]) {
        self.factId = factId;
        self.title = title;
        self.body = body;
        self.isFactOfTheDay = isFactOfTheDay;
    }
    return self;
}

@end
