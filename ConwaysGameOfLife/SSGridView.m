//
//  SSGridView.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSGridView.h"
#import "SSBoxButton.h"
#import "UIImage+TileImage.h"
@interface SSGridView()

@property (nonatomic, strong) NSArray *images;

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

- (UIImage*) getNextImage
{
    if (!self.images) {
        self.images = @[[UIImage imageNamed:@"paris.jpg"],
                        [UIImage imageNamed:@"seattle.jpg"],
                        [UIImage imageNamed:@"sydney.jpg"]
                         ];
    }
    
    NSInteger randomImageIndex = arc4random()%[self.images count];
    return self.images[randomImageIndex];
}

-(NSArray*) makeGrid{
    NSMutableArray *state = [[NSMutableArray alloc] init];
    
    UIImage *originalImage = [self getNextImage];
    
    CGFloat x = PADSIZE;
    CGFloat y = PADSIZE;
    for (int i=0; i<TOTAL_BOXES_IN_COLUMN;i++) {
        NSMutableArray *row = [[NSMutableArray alloc] init];
        for (int j=0; j<TOTAL_BOXES_IN_COLUMN;j++) {
            CGRect boxFrame = CGRectMake(x, y, BOX_SIZE, BOX_SIZE);
            SSBoxButton *thisButton = [[SSBoxButton alloc] initWithFrame:boxFrame];
            
            UIImage *croppedImage = [originalImage cropImageInRect:boxFrame];
            [thisButton setImage:croppedImage forState:UIControlStateNormal];
            
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

-(NSArray*) makeiPhoneGrid{
    NSMutableArray *state = [[NSMutableArray alloc] init];
    
    UIImage *originalImage = [self getNextImage];
    
    CGFloat x = SMALL_PADSIZE;
    CGFloat y = SMALL_PADSIZE;
    for (int i=0; i<TOTAL_BOXES_IN_ROW;i++) {
        NSMutableArray *row = [[NSMutableArray alloc] init];
        for (int j=0; j<TOTAL_BOXES_IN_COLUMN;j++) {
            CGRect boxFrame = CGRectMake(x, y, BOX_SIZE, BOX_SIZE);
            
            SSBoxButton *thisButton = [[SSBoxButton alloc] initWithFrame:boxFrame];
            
            UIImage *croppedImage = [originalImage cropImageInRect:boxFrame];
            [thisButton setImage:croppedImage forState:UIControlStateNormal];
            
            [thisButton setRowIndex:i];
            [thisButton setColumnIndex:j];
            [self addSubview:thisButton];
            [row addObject:thisButton];
            x+=SMALL_BOX_SIZE+SMALL_PADSIZE;
        }
        [state addObject:row];
        y+= SMALL_BOX_SIZE+SMALL_PADSIZE;
        x= SMALL_PADSIZE;
    }
    return [NSArray arrayWithArray:state];
}


@end
