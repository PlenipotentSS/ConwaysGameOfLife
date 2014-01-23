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
        [self setDead];
    } else {
        [self setAlive];
    }
}

-(void) setDead {
    self.isAlive = NO;
    self.backgroundColor = [UIColor whiteColor];
    NSLog(@"Row: %i Column: %i",self.rowIndex,self.columnIndex);
}

-(void) setAlive {
    self.isAlive = YES;
    self.backgroundColor = [UIColor blackColor];
    NSLog(@"Row: %i Column: %i",self.rowIndex,self.columnIndex);
}

@end
