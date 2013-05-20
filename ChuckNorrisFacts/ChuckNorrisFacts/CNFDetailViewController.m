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

- (void)setSelectNextFactHandler:(void (^)(CNFDetailViewController*))handler
{
    selectNextFactHandler = [handler copy];
}

- (void)setSelectPreviousFactHandler:(void (^)(CNFDetailViewController*))handler
{
    selectPreviousFactHandler = [handler copy];
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
    
    UISwipeGestureRecognizer* swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [[self view] addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer* swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:swipeDown];
}

- (void)swipeUp:(UISwipeGestureRecognizer*)recoginzer
{
    selectNextFactHandler(self);
}

- (void)swipeDown:(UISwipeGestureRecognizer*)recoginzer
{
    selectPreviousFactHandler(self);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
