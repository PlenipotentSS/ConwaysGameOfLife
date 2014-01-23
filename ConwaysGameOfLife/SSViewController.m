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
@property (nonatomic) IBOutlet SSGridView *theGrid;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic) SSGameState *theGame;

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.theGame = [SSGameState new];
    self.theGame.delegate = self;
    self.theGame.state = [self.theGrid makeGrid];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetGrid:(id)sender {
    [self.theGame resetGrid];
}

- (IBAction)switchDamnit:(id)sender {
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
