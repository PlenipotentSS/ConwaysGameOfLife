//
//  SSGameState.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSGameState.h"
#import "SSBoxButton.h"

@implementation SSGameState


-(void) startGameLoop {
    NSLog(@"Start");
    [self.delegate setGridState:NO];
    
    for (SSBoxButton *box in self.state) {
        if (box.isAlive) {
            NSInteger numNeighborsAlive = [self numberOfNeighborsAliveAtRow:box.rowIndex atColumn:box.columnIndex];
            NSLog(@"%i",numNeighborsAlive);
        }
    }
}

-(void) stopGameLoop {
    NSLog(@"Stop");
    [self.delegate setGridState:YES];
}

-(NSInteger) numberOfNeighborsAliveAtRow:(NSInteger) row atColumn:(NSInteger) column {
    
    return 0;
}

@end