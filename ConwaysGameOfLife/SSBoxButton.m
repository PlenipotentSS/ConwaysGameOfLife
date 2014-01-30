//
//  SSBoxButton.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
// 

#import "SSBoxButton.h"
@interface SSBoxButton()

@property (nonatomic) CGFloat frequency;

@end

@implementation SSBoxButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frequency = 0;
        self.backgroundColor = [UIColor whiteColor];
        [self addTarget:self action:@selector(boxSelected) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void) boxSelected {
    if (self.isAlive) {
        [self setIsAlive:NO];
    } else {
        _frequency = 0;
        [self setIsAlive:YES];
    }
}

-(void) resetFrequency {
    _frequency = 0;
}

- (void)setIsAlive:(BOOL)isAlive
{
    _isAlive = isAlive;
    if (isAlive) {
        self.frequency += .1;
        self.backgroundColor = [UIColor colorWithWhite:(1-self.frequency) alpha:1.0];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
