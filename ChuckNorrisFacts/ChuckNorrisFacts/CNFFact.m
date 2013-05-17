//
//  CNFFact.m
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import "CNFFact.h"

@implementation CNFFact

- (id) initWithId:(int)jokeId title:(NSString*)title body:(NSString*)body date:(NSDate*)date rating:(int)rating andRatingCount:(int)ratingCount
{
    if (self = [self init]) {
        self.jokeId = jokeId;
        self.title = title;
        self.body = body;
        self.date = date;
        self.rating = rating;
        self.ratingCount = ratingCount;
    }
    return self;
}

@end
