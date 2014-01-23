//
//  SSGridView.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSGridView.h"
#import "SSBoxButton.h"
@interface SSGridView()

@end
@implementation SSGridView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(NSArray*) makeGrid{
    NSMutableArray *state = [[NSMutableArray alloc] init];
    
    CGFloat x = PADSIZE;
    CGFloat y = PADSIZE;
    for (int i=0; i<TOTAL_BOXES_IN_ROW;i++) {
        NSMutableArray *row = [[NSMutableArray alloc] init];
        for (int j=0; j<TOTAL_BOXES_IN_ROW;j++) {
            SSBoxButton *thisButton = [[SSBoxButton alloc] initWithFrame:CGRectMake(x, y, BOX_SIZE, BOX_SIZE)];
            [thisButton setRowIndex:i];
            [thisButton setColumnIndex:j];
            [self addSubview:thisButton];
            [row addObject:thisButton];
            x+=BOX_SIZE+PADSIZE;
        }
        [state addObject:row];
        y+= BOX_SIZE+PADSIZE;
        x= PADSIZE;
    }
    return [NSArray arrayWithArray:state];
}

@end
