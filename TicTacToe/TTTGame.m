//
//  TTTGame.m
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import "TTTGame.h"
#import "TTTGameCell.h"

NSString *const TTTToe = @"O";
NSString *const TTTTic = @"X";

@implementation TTTGame

@synthesize currentPlayer;
@synthesize gameGrid;

- (id)initWithGameGrid:(NSMutableArray *)grid {
    self = [TTTGame new];
    if(self) {
        self.gameGrid = grid;
        self.currentPlayer = TTTPlayerFirstPlayer;
    }
    return self;
}

- (void)gameCellClick:(TTTGameCell *)gameCell {
    if(self.currentPlayer == TTTPlayerFirstPlayer) {
        [self firstGamerClick:gameCell];
    } else {
        [self secondGamerClick:gameCell];
    }
}

- (void)firstGamerClick:(TTTGameCell *)gameCell {
    self.currentPlayer = TTTPlayerSecondPlayer;
    gameCell.currentGameValue = TTTGameValueToe;
    [gameCell setTitle:TTTToe forState:UIControlStateNormal];
    [gameCell setCurrentGameValue:TTTGameValueToe];
}

- (void)secondGamerClick:(TTTGameCell *)gameCell {
    self.currentPlayer = TTTPlayerFirstPlayer;
    gameCell.currentGameValue = TTTGameValueTic;
    [gameCell setTitle:TTTTic forState:UIControlStateNormal];
    [gameCell setCurrentGameValue:TTTGameValueTic];
}

@end
