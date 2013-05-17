//
//  CNFFOTDViewController.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFFOTDViewController.h"
#import "CNFDataProvider.h"
#import "CNFFact.h"

@interface CNFFOTDViewController ()
{
    CNFDataProvider* dataProvider;
}

@end

@implementation CNFFOTDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataProvider = [CNFDataProvider sharedDataProvider];
    self.theFact.text = [dataProvider getFactOfTheDay].body;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
