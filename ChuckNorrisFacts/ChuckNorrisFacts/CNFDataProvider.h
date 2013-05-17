//
//  CNFDataProvider.h
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNFFact.h"

@interface CNFDataProvider : NSObject

+ (CNFDataProvider*) sharedDataProvider;

- (int) getNumberOfFacts;
- (NSArray*) getAllFacts;
- (CNFFact*) getFactOfTheDay;
- (CNFFact*) getRandomFact;
- (CNFFact*) getFactAtIndex:(int)index;

@end
