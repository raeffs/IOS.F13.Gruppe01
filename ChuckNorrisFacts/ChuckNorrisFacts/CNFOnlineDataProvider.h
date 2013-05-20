//
//  CNFOnlineDataProvider.h
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNFFact.h"

@interface CNFOnlineDataProvider : NSObject

+ (CNFOnlineDataProvider*) sharedDataProvider;

- (int) getNumberOfFacts;
- (NSArray*) getAllFacts;
- (CNFFact*) getFactOfTheDay;
- (CNFFact*) getRandomFact;
- (CNFFact*) getFactAtIndex:(int)index;

- (void) refreshDataWithCompletitionHandler:(void(^)(void))handler;

@end
