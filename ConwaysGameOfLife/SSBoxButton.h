//
//  SSBoxButton.h
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBoxButton : UIButton

@property (nonatomic) BOOL isAlive;
@property (nonatomic) NSInteger rowIndex;
@property (nonatomic) NSInteger columnIndex;

@end
