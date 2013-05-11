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
    return NULL;
}

- (CNFFact*) getFactOfTheDay
{
    CNFFact* myCNFFact = [[alloc CNFFact] init];
    

}

- (CNFFact*) getRandomFact
{
    return NULL;
}

@end
