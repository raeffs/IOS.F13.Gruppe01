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
    
    dataProvider = [CNFOnlineDataProvider sharedDataProvider];
    headerView = [self navigationItem].titleView;
    
    [self updateView];
}

- (void)swipeLeft:(UISwipeGestureRecognizer*)recoginzer
{
    NSUInteger selectedIndex = [[self tabBarController] selectedIndex];
    [[self tabBarController] setSelectedIndex:selectedIndex + 1];
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
        [self updateView];
        [aView stopAnimating];
        [self navigationItem].titleView = headerView;
    }];
    
}

- (void)updateView
{
    CNFFact* fact = [dataProvider getFactOfTheDay];
    if (fact != nil)
    {
        self.theFact.text = fact.body;
    }
}

@end
