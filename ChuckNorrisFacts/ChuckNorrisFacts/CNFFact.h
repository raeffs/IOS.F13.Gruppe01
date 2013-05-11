//
//  CNFFact.h
//  ChuckNorrisFacts
//
//  Created by JoeFlyclapper on 5/11/13.
//  Copyright (c) 2013 RaffiAndStefanGmbh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNFFact : NSObject

@property int jokeID;
@property(strong) NSString* body;
@property(strong) NSDate* date;
@property int rating;
@property int ratingCount;

- (id) initWithId:(int)jokeId body:(NSString*)body date:(NSDate*)date rating:(int)rating andRatingCount:(int)ratingCount;

@end
