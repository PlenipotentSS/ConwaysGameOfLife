//
//  SSViewController.m
//  ConwaysGameOfLife
//
//  Created by Stevenson on 1/23/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "SSViewController.h"
#import "SSGridView.h"
#import "SSGameState.h"

@interface SSViewController () <SSGameStateDelegate>
@property (weak,nonatomic) IBOutlet SSGridView *theGrid;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic) SSGameState *theGame;
@property (weak,nonatomic) IBOutlet UISlider *speedSlider;

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.theGame = [SSGameState new];
    self.theGame.delegate = self;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSLog(@"using iPad");
        self.theGame.state = [self.theGrid makeGrid];
    } else {
        self.theGame.state = [self.theGrid makeiPhoneGrid];
    }
    
    [self.speedSlider addTarget:self action:@selector(updateSpeed) forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) updateSpeed {
    CGFloat newTimerSpeed = INITIAL_SPEED/self.speedSlider.value;
    [self.theGame setRedrawTimer:newTimerSpeed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated .
}

- (void) changeImage
{
    self.theGame.state = [self.theGrid makeGrid];
}

- (IBAction)resetGrid:(id)sender {
    [self.theGame resetGrid];
    [self changeImage];
}

- (IBAction)startRunning:(id)sender {
    self.isPlaying = [(UISwitch*)sender isOn];
    if (self.isPlaying) {
        [self.theGame startGameLoop];
    } else {
        [self.theGame stopGameLoop];
    }
}

-(void) setGridState:(BOOL)interaction {
    self.theGrid.userInteractionEnabled = interaction;
}

@end
