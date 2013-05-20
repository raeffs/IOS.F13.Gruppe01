//
//  CNFOnlineDataProvider.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFOnlineDataProvider.h"
#import <stdlib.h>
#import <RestKit.h>

@interface CNFOnlineDataProvider ()
{
    NSArray* data;
}

@end

@implementation CNFOnlineDataProvider

static CNFOnlineDataProvider* sharedDataProvider;

+ (CNFOnlineDataProvider*) sharedDataProvider
{
    if (sharedDataProvider == NULL)
    {
        sharedDataProvider = [[CNFOnlineDataProvider alloc] init];
    }
    return sharedDataProvider;
}

- (id)init
{
    if (self = [super init])
    {
        data = [[NSArray alloc] init];
        [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    }
    return self;
}

- (int) getNumberOfFacts
{
    return [data count];
}

- (NSArray*) getAllFacts
{
    return data;
}

- (CNFFact*) getFactOfTheDay
{
    for (CNFFact* candidate in data) {
        if (candidate.isFactOfTheDay) {
            return candidate;
        }
    }
    return nil;
}

- (CNFFact*) getRandomFact
{
    int numberOfFacts = [self getNumberOfFacts];
    int randomIndex = arc4random() % numberOfFacts;
    return [self getFactAtIndex:randomIndex];
}

- (CNFFact*) getFactAtIndex:(int)index
{
    return [[self getAllFacts] objectAtIndex:index];
}

- (void) refreshDataWithCompletitionHandler:(void(^)(void))handler
{
    void(^completitionHandler)(void) = [handler copy];
    
    RKObjectRequestOperation* operation = [self getOperationWithUrl:@"http://www.raphaelfleischlin.ch//facts.json"];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        data = [mappingResult array];
        completitionHandler();
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        completitionHandler();
    }];
    [operation start];
}

- (RKObjectRequestOperation*) getOperationWithUrl:(NSString*)url
{
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[CNFFact class]];
    [mapping addAttributeMappingsFromArray:[NSArray arrayWithObjects:@"factId", @"title", @"body", @"isFactOfTheDay", nil]];
    RKResponseDescriptor* descriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:nil statusCodes:nil];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    return [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[descriptor]];
}

@end
