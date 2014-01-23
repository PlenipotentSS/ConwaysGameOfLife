//
//  SSGameState.h
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSGameStateDelegate <NSObject>

-(void) setGridState: (BOOL) interaction;

@end

@interface SSGameState : NSObject

@property (unsafe_unretained) id<SSGameStateDelegate> delegate;

@property (nonatomic) NSArray *state;

-(void) startGameLoop;
-(void) stopGameLoop;
-(void) resetGrid;

@end
