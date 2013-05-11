//
//  CNFDataProvider.m
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import "CNFDataProvider.h"

@implementation CNFDataProvider


static CNFDataProvider* sharedDataProvider;

+ (CNFDataProvider*) sharedDataProvider
{
    if (sharedDataProvider == NULL)
    {
        sharedDataProvider = [[CNFDataProvider alloc] init];
    }
    return sharedDataProvider;
}


- (NSArray*) getAllFacts
{
    return [NSArray arrayWithObjects:
            [[CNFFact alloc] initWithId:1 body:@"Chuck Norris ..." date:[NSDate date] rating:5 andRatingCount:23],
            [[CNFFact alloc] initWithId:1 body:@"Chuck Norris 2..." date:[NSDate date] rating:3 andRatingCount:21],
            [[CNFFact alloc] initWithId:1 body:@"Chuck Norris 3..." date:[NSDate date] rating:2 andRatingCount:12],
            [[CNFFact alloc] initWithId:1 body:@"Chuck Norris 4..." date:[NSDate date] rating:4 andRatingCount:4],
            [[CNFFact alloc] initWithId:1 body:@"Chuck Norris 5..." date:[NSDate date] rating:1 andRatingCount:5],
            nil];
}

- (CNFFact*) getFactOfTheDay
{
    CNFFact* myCNFFact = [[CNFFact alloc] initWithId:1 body:@"FactOfTheDay" date:[NSDate date] rating:4 andRatingCount:2];
    
    return myCNFFact;
    
}

- (CNFFact*) getRandomFact
{
    CNFFact* myCNFFact = [[CNFFact alloc] initWithId:1 body:@"RandomFact" date:[NSDate date] rating:4 andRatingCount:2];
    
    return myCNFFact;
}

@end
