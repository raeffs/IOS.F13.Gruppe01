//
//  CNFDetailViewController.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFDetailViewController.h"
#import "CNFFact.h"

@interface CNFDetailViewController ()
{
    CNFFact* _fact;
}
@end

@implementation CNFDetailViewController

#pragma mark - Managing the detail item

- (void)setFact:(CNFFact *)fact
{
    if (_fact != fact)
    {
        _fact = fact;
        [self configureView];
    }
}

- (void)configureView
{
    if (_fact) {
        self.navigation.title = _fact.title;
        self.theFact.text = _fact.body;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
