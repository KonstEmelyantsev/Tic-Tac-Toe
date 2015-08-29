//
//  TTTGameCell.m
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import "TTTGameCell.h"

NSString *const TTTToe = @"O";
NSString *const TTTTic = @"X";

@implementation TTTGameCell

@synthesize currentGameValue;

- (void)resetGameValue {
    [self setCurrentGameValue:TTTGameValueNone];
    [self setTitle:@"" forState:UIControlStateNormal];
    [self setEnabled:YES];
}

- (void)firstGamerClick {
    [self setTitle:TTTToe forState:UIControlStateNormal];
    [self setCurrentGameValue:TTTGameValueToe];
}

- (void)secondGamerClick {
    [self setTitle:TTTTic forState:UIControlStateNormal];
    [self setCurrentGameValue:TTTGameValueTic];
}

@end
