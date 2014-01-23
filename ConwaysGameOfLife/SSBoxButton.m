//
//  SSBoxButton.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSBoxButton.h"
@interface SSBoxButton()

@end

@implementation SSBoxButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addTarget:self action:@selector(boxSelected) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void) boxSelected {
    if (self.isAlive) {
        [self setIsAlive:NO];
    } else {
        [self setIsAlive:YES];
    }
}

- (void)setIsAlive:(BOOL)isAlive
{
    _isAlive = isAlive;
    if (isAlive) {
        self.backgroundColor = [UIColor blackColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
