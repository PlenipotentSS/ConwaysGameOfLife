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
@property (strong, nonatomic) UIView *coverView;

@end

@implementation SSBoxButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frequency = 0;
        [self setupCover];
        [self addTarget:self action:@selector(boxSelected) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setupCover
{
    self.coverView = [[UIView alloc] initWithFrame:self.bounds];
    self.coverView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:self.coverView aboveSubview:self.imageView];
    [self.coverView setAlpha:1.f];

    UITapGestureRecognizer *coverTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxSelected)];
    coverTap.numberOfTapsRequired = 1;
    self.userInteractionEnabled = YES;
    [self.coverView addGestureRecognizer:coverTap];
}

-(void) boxSelected {
    if (self.isAlive) {
        [self setIsAlive:NO];
    } else {
        [self resetFrequency];
        [self setIsAlive:YES];
    }
}

-(void) resetFrequency {
    _frequency = 0;
}

- (void)setIsAlive:(BOOL)isAlive
{
    _isAlive = isAlive;
    if (isAlive && self.frequency == 0) {
        self.coverView.backgroundColor = [UIColor colorWithWhite:(.9) alpha:1.0];
    } else {
        [self.coverView setAlpha:1.f];
        self.coverView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)increaseFrequencyChange{
    self.frequency += .005;
    CGFloat alpha = MIN(1.f,(20 * self.frequency));
//    CGFloat hue = MAX(0.f, (1.f-(self.frequency+.1)));
//    CGFloat brightness = MIN(.9,alpha);
//    self.backgroundColor = [UIColor colorWithHue:hue saturation:1.f brightness:brightness alpha:alpha];
    [self.coverView setAlpha:1-alpha];
}

@end
