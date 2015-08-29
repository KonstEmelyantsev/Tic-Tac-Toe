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
        [self setGameGrid:grid];
        for(TTTGameCell *gameCell in self.gameGrid) {
            [gameCell setCurrentGameValue:TTTGameValueNone];
        }
        [self setCurrentPlayer:TTTPlayerFirstPlayer];
    }
    return self;
}

- (void)gameCellClick:(TTTGameCell *)gameCell {
    [gameCell setEnabled:NO];
    if(self.currentPlayer == TTTPlayerFirstPlayer) {
        [self firstGamerClick:gameCell];
    } else {
        [self secondGamerClick:gameCell];
    }
}

- (void)firstGamerClick:(TTTGameCell *)gameCell {
    [self setCurrentPlayer:TTTPlayerSecondPlayer];
    [gameCell setTitle:TTTToe forState:UIControlStateNormal];
    [gameCell setCurrentGameValue:TTTGameValueToe];
}

- (void)secondGamerClick:(TTTGameCell *)gameCell {
    [self setCurrentPlayer:TTTPlayerFirstPlayer];
    [gameCell setTitle:TTTTic forState:UIControlStateNormal];
    [gameCell setCurrentGameValue:TTTGameValueTic];
}

- (void)gameStep:(TTTGameCell *)gameCell {
    for(TTTGameCell *cell in self.gameGrid) {
        if(cell.tag == gameCell.tag) {
            [cell setCurrentGameValue:gameCell.currentGameValue];
        }
    }
}

@end
