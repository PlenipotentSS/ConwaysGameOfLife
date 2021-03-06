//
//  SSGameState.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSGameState.h"
#import "SSBoxButton.h"
@interface SSGameState()

@property (nonatomic) NSOperationQueue *background;
@property (nonatomic) NSTimer *runTimer;

@end

@implementation SSGameState

-(id) init {
    self = [super init];
    if (self) {
        _redrawTimer = INITIAL_SPEED;
    }
    return self;
}

#pragma mark - Start Game Loop Methods
-(void) startGameLoop {
    [self.delegate setGridState:NO];
    
    self.background = [[NSOperationQueue alloc] init];
    self.runTimer = [NSTimer scheduledTimerWithTimeInterval:self.redrawTimer target:self selector:@selector(runStateChange) userInfo:nil repeats:YES];
    [self.runTimer fire];
}

-(void) setRedrawTimer:(CGFloat)redrawTimer {
    _redrawTimer = redrawTimer;
    if (self.runTimer) {
        [self.runTimer invalidate];
        self.runTimer = [NSTimer scheduledTimerWithTimeInterval:self.redrawTimer target:self selector:@selector(runStateChange) userInfo:nil repeats:YES];
    }
}

-(void) runStateChange {
    NSMutableArray *changesNeeded = [[NSMutableArray alloc] init];
    for (NSArray *row in self.state) {
        for (SSBoxButton *box in row) {
            //NSLog(@"rowIndex: %i ColumnIndex: %i",box.rowIndex,box.columnIndex);
            NSInteger numNeighborsAlive = [self numberOfNeighborsAliveAtRow:box.rowIndex atColumn:box.columnIndex];
            BOOL newAliveState = [self shouldCellBeAliveWithNumNeighborsAlive:numNeighborsAlive andIsCurrentlyAlive:box.isAlive];
            if (newAliveState != box.isAlive) {
                [changesNeeded addObject:box];
            }
            if (newAliveState == YES) {
                // change color of box
                [box increaseFrequencyChange];
            }
        }
    }
    for (SSBoxButton* box in changesNeeded) {
        [box setIsAlive:!box.isAlive];
        if (box.isAlive == YES) {
            [box increaseFrequencyChange];
        }
    }
    
}

-(BOOL) shouldCellBeAliveWithNumNeighborsAlive: (NSInteger) neighborsCount andIsCurrentlyAlive: (BOOL) isAlive {
    if (neighborsCount<2){
        return NO;
    } else if (neighborsCount>3) {
        return NO;
    } else if ((neighborsCount == 2 && isAlive) || neighborsCount == 3) {
        return YES;
    }
    return isAlive;
}

-(NSInteger) numberOfNeighborsAliveAtRow:(NSInteger) row atColumn:(NSInteger) column {
 
    NSInteger aliveBoxes = 0;
    for (int rowIndex = (int)row-1;rowIndex <row+2;rowIndex++ ) {
        for (int columnIndex = (int)column-1;columnIndex <column+2;columnIndex++ ) {
            NSInteger numberOfRows = TOTAL_BOXES_IN_ROW;
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                numberOfRows = TOTAL_BOXES_IN_COLUMN;
            }
            if (!(rowIndex < 0 || columnIndex < 0 || rowIndex ==  numberOfRows || columnIndex == TOTAL_BOXES_IN_COLUMN)){
                
                if (!(rowIndex == row && columnIndex == column)) {
                    SSBoxButton *thisBox = [[self.state objectAtIndex:rowIndex] objectAtIndex:columnIndex];
                    if ([thisBox isAlive]) {
                        aliveBoxes++;
                    }
                }
            }
        }
    }
    return aliveBoxes;
}

#pragma mark - End Game Loop Methods
-(void) stopGameLoop {
    [self.delegate setGridState:YES];
    [self.runTimer invalidate];
    self.runTimer = nil;
    [self.background cancelAllOperations];
}


-(void) resetGrid {
    if (self.runTimer) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Can't Reset" message:@"Cannot Reset Grid while running Conways Game Of Life" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    } else {
        for (NSArray *row in self.state) {
            for (SSBoxButton *box in row) {
                [box setIsAlive:NO];
            }
        }
    }
}


@end