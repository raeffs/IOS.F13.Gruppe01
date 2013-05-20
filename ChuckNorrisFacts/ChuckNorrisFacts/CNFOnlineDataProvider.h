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
{
    void (^getAllFactsCompletitionHandler)(NSArray* result);
    void (^getAllFactsErrorHandler)(NSError* error);
    void (^getFactOfTheDayCompletitionHandler)(CNFFact* result);
    void (^getFactOfTheDayErrorHandler)(NSError* error);
}

- (void) getAllFactsWithCompletitionHandler:(void(^)(NSArray*))completitionHandler andErrorHandler:(void(^)(NSError*))errorHandler;
- (void) getFactOfTheDayWithCompletitionHandler:(void(^)(CNFFact*))completitionHandler andErrorHandler:(void(^)(NSError*)) errorHandler;

@end
