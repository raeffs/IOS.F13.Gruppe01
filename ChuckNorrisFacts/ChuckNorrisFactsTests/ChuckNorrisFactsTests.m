//
//  ChuckNorrisFactsTests.m
//  ChuckNorrisFactsTests
//
//  Created by Raphael Fleischlin on 20.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "ChuckNorrisFactsTests.h"

@interface ChuckNorrisFactsTests ()
{
    CNFOnlineDataProvider* sut;
    NSArray* testData;
}

@end

@implementation ChuckNorrisFactsTests

- (void)setUp
{
    [super setUp];
    
    sut = [[CNFOnlineDataProvider alloc] init];
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)setUpWithData
{
    testData = [NSArray arrayWithObjects:
                [[CNFFact alloc] initWithId:1 title:@"Fact 1" body:@"Here" andIsFactOfTheDay:NO],
                [[CNFFact alloc] initWithId:2 title:@"Fact 2" body:@"we" andIsFactOfTheDay:NO],
                [[CNFFact alloc] initWithId:3 title:@"Fact 3" body:@"go" andIsFactOfTheDay:YES],
                [[CNFFact alloc] initWithId:4 title:@"Fact 4" body:@"!" andIsFactOfTheDay:NO],
                nil];
    [sut setDataForTesting:testData];
}

- (void)testGetFactOfTheDay
{
    [self setUpWithData];
    
    CNFFact* factOfTheDay = [sut getFactOfTheDay];
    
    STAssertEquals(3, factOfTheDay.factId, nil);
}

- (void)testGetAllFacts
{
    [self setUpWithData];
    
    NSArray* facts = [sut getAllFacts];
    
    STAssertEquals(4, [facts count], nil);
}

- (void)testGetNumberOfFacts
{
    [self setUpWithData];
    
    int numberOfFacts = [sut getNumberOfFacts];
    
    STAssertEquals(4, numberOfFacts, nil);
}

- (void)testGetRandomFact
{
    [self setUpWithData];
    
    CNFFact* randomFact = [sut getRandomFact];
    
    STAssertNotNil(randomFact, nil);
}

- (void)testGetFactAtIndex
{
    [self setUpWithData];
    
    CNFFact* fact = [sut getFactAtIndex:2];
    
    STAssertEquals(3, fact.factId, nil);
}

- (void)setUpWithoutData
{
    // nothing to do
}

- (void)testGetFactOfTheDay_withoutData
{
    [self setUpWithoutData];
    
    CNFFact* factOfTheDay = [sut getFactOfTheDay];
    
    STAssertNil(factOfTheDay, nil);
}

- (void)testGetAllFacts_withoutData
{
    [self setUpWithoutData];
    
    NSArray* facts = [sut getAllFacts];
    
    STAssertEquals(0, [facts count], nil);
}

- (void)testGetNumberOfFacts_withoutData
{
    [self setUpWithoutData];
    
    int numberOfFacts = [sut getNumberOfFacts];
    
    STAssertEquals(0, numberOfFacts, nil);
}

- (void)testGetRandomFact_withoutData
{
    [self setUpWithoutData];
    
    CNFFact* randomFact = [sut getRandomFact];
    
    STAssertNil(randomFact, nil);
}

- (void)testGetFactAtIndex_withoutData
{
    [self setUpWithoutData];
    
    CNFFact* fact = [sut getFactAtIndex:5];
    
    STAssertNil(fact, nil);
}

@end
