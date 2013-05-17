//
//  CNFDetailViewController.h
//  ChuckNorrisFacts
//
//  Created by Raphael Fleischlin on 17.05.13.
//  Copyright (c) 2013 S. Bachmann & R. Fleischlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNFFact.h"

@interface CNFDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navigation;
@property (weak, nonatomic) IBOutlet UILabel *theFact;

- (void) setFact:(CNFFact*)fact;

@end
