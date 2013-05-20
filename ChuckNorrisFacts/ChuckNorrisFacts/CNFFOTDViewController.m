//
//  CNFFOTDViewController.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFFOTDViewController.h"
#import "CNFOnlineDataProvider.h"
#import "CNFFact.h"

@interface CNFFOTDViewController ()
{
    CNFOnlineDataProvider* dataProvider;
    UIView* headerView;
}

@end

@implementation CNFFOTDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:swipeLeft];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [[self view] addGestureRecognizer:tap];
    
    dataProvider = [CNFOnlineDataProvider sharedDataProvider];
    headerView = [self navigationItem].titleView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateView];
}

- (void)swipeLeft:(UISwipeGestureRecognizer*)recoginzer
{
    NSUInteger selectedIndex = [[self tabBarController] selectedIndex];
    [[self tabBarController] setSelectedIndex:selectedIndex + 1];
}

- (void)tap:(UITapGestureRecognizer*)recoginzer
{
    CNFFact* fact = [dataProvider getRandomFact];
    if (fact != nil)
    {
        self.navigationItem.title = @"Random";
        self.theFact.text = fact.body;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)refreshPressed:(UIBarButtonItem *)sender {
    
    UIActivityIndicatorView* aView = [[UIActivityIndicatorView alloc] init];
    [self navigationItem].titleView = aView;
    [aView startAnimating];
    
    [dataProvider refreshDataWithCompletitionHandler:^{
        [NSThread sleepForTimeInterval:1];
        [aView stopAnimating];
        [self navigationItem].titleView = headerView;
        [self updateView];
    }];
    
}

- (void)updateView
{
    CNFFact* fact = [dataProvider getFactOfTheDay];
    if (fact != nil)
    {
        self.navigationItem.title = @"FOTD";
        self.theFact.text = fact.body;
    }
}

@end
