//
//  CNFDataProvider.m
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import "CNFDataProvider.h"
#import <stdlib.h>

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

- (int)getNumberOfFacts
{
    return [[self getAllFacts] count];
}

- (NSArray*) getAllFacts
{
    return [NSArray arrayWithObjects:
            [[CNFFact alloc] initWithId:1 title:@"Telephone invention" body:@"When Alexander Bell invented the telephone he had 3 missed calls from Chuck Norris." date:[NSDate date] rating:5 andRatingCount:23],
            [[CNFFact alloc] initWithId:1 title:@"Chuck Norris & the Death" body:@"Chuck Norris died 20 years ago, Death just hasn't built up the courage to tell him yet." date:[NSDate date] rating:3 andRatingCount:21],
            [[CNFFact alloc] initWithId:1 title:@"Chuck Norris on Mars" body:@"Chuck Norris has already been to Mars; that's why there are no signs of life." date:[NSDate date] rating:2 andRatingCount:12],
            [[CNFFact alloc] initWithId:1 title:@"The toilet" body:@"Chuck Norris doesn't flush the toilet, he scares the shit out of it." date:[NSDate date] rating:4 andRatingCount:4],
            [[CNFFact alloc] initWithId:1 title:@"Chuck Norris in Africa" body:@"When Chuck Norris visits Africa, the animals are required to stay in their cars." date:[NSDate date] rating:1 andRatingCount:5],
            nil];
}

- (CNFFact*) getFactOfTheDay
{
    return [self getFactAtIndex:3];
}

- (CNFFact*) getRandomFact
{
    int numberOfFacts = [self getNumberOfFacts];
    int randomIndex = arc4random() % numberOfFacts;
    return [self getFactAtIndex:randomIndex];
}

- (CNFFact *)getFactAtIndex:(int)index
{
    return [[self getAllFacts] objectAtIndex:index];
}

@end
