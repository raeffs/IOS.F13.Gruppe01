//
//  CNFOnlineDataProvider.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFOnlineDataProvider.h"
#import <RestKit.h>

@implementation CNFOnlineDataProvider

- (id)init
{
    if (self = [super init])
    {
        [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    }
    return self;
}

- (void)getAllFactsWithCompletitionHandler:(void (^)(NSArray *))completitionHandler andErrorHandler:(void (^)(NSError *))errorHandler
{
    getAllFactsCompletitionHandler = [completitionHandler copy];
    getAllFactsErrorHandler = [errorHandler copy];
    
    RKObjectRequestOperation* operation = [self getOperationWithUrl:@"http://www.raphaelfleischlin.ch//facts.json"];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        getAllFactsCompletitionHandler([mappingResult array]);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        getAllFactsErrorHandler(error);
    }];
    
    [operation start];
}

- (void)getFactOfTheDayWithCompletitionHandler:(void (^)(CNFFact *))completitionHandler andErrorHandler:(void (^)(NSError *))errorHandler
{
    getFactOfTheDayCompletitionHandler = [completitionHandler copy];
    getFactOfTheDayErrorHandler = [errorHandler copy];
    
    RKObjectRequestOperation* operation = [self getOperationWithUrl:@"http://www.raphaelfleischlin.ch//fotd.json"];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        getFactOfTheDayCompletitionHandler([[mappingResult array] objectAtIndex:0]);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        getFactOfTheDayErrorHandler(error);
    }];
    
    [operation start];
}

- (RKObjectRequestOperation*) getOperationWithUrl:(NSString*)url
{
    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[CNFFact class]];
    [mapping addAttributeMappingsFromArray:[NSArray arrayWithObjects:@"factId", @"title", @"body", nil]];
    RKResponseDescriptor* descriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:nil statusCodes:nil];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    return [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[descriptor]];
}

@end
