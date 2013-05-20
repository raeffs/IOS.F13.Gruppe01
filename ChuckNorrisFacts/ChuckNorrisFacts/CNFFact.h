//
//  CNFFact.h
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNFFact : NSObject

@property int factId;
@property(strong) NSString* title;
@property(strong) NSString* body;
@property BOOL isFactOfTheDay;

- (id) initWithId:(int)jokeId title:(NSString*)title body:(NSString*)body andIsFactOfTheDay:(BOOL)isFactOfTheDay;

@end
