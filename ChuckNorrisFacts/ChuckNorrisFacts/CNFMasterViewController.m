//
//  CNFMasterViewController.m
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import "CNFMasterViewController.h"
#import "CNFDetailViewController.h"
#import "CNFOnlineDataProvider.h"
#import "CNFFact.h"

@interface CNFMasterViewController () {
    CNFOnlineDataProvider* dataProvider;
    int lastIndex;
    UIView* headerView;
}
@end

@implementation CNFMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:swipeRight];
    
    dataProvider = [CNFOnlineDataProvider sharedDataProvider];
    headerView = [self navigationItem].titleView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateView];
}

- (void)swipeRight:(UISwipeGestureRecognizer*)recoginzer
{
    NSUInteger selectedIndex = [[self tabBarController] selectedIndex];
    [[self tabBarController] setSelectedIndex:selectedIndex - 1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataProvider getNumberOfFacts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CNFFact* fact = [dataProvider getFactAtIndex:indexPath.row];
    cell.textLabel.text = fact.title;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        lastIndex = [self.tableView indexPathForSelectedRow].row;
        CNFFact* fact = [dataProvider getFactAtIndex:lastIndex];
        [[segue destinationViewController] setFact:fact];
        [[segue destinationViewController] setSelectNextFactHandler:^(CNFDetailViewController *controller) {
            [self selectNextFact:controller];
        }];
        [[segue destinationViewController] setSelectPreviousFactHandler:^(CNFDetailViewController *controller) {
            [self selectPreviousFact:controller];
        }];
    }
}

- (void)selectNextFact:(CNFDetailViewController*)controller
{
    if ([dataProvider getNumberOfFacts] - 1 > lastIndex)
    {
        lastIndex++;
        [controller setFact:[dataProvider getFactAtIndex:lastIndex]];
    }
}

- (void)selectPreviousFact:(CNFDetailViewController*)controller
{
    if (lastIndex > 0) {
        lastIndex--;
        [controller setFact:[dataProvider getFactAtIndex:lastIndex]];
    }
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
    [[self tableView] reloadData];
}

@end
