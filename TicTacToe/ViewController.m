//
//  ViewController.m
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import "ViewController.h"
#import "TTTGameCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet TTTGameCell *topLeftButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *topCenterButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *topRightButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *centerLeftButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *centerCenterButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *centerRightButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *bottomLeftButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *bottomCenterButton;
@property (weak, nonatomic) IBOutlet TTTGameCell *bottomRightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)updateData {
    self.gameGrid = [[NSMutableArray alloc] initWithArray:@[self.topLeftButton, self.topCenterButton, self.topRightButton, self.centerLeftButton, self.centerCenterButton, self.centerRightButton, self.bottomLeftButton, self.bottomCenterButton, self.bottomRightButton]];
}

@end
