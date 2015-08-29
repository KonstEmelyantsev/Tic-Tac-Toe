//
//  TTTGameController.m
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import "TTTGameController.h"
#import "TTTGameCell.h"

NSString *const TTTFirtsPlayerWin = @"Победил первый игрок!";
NSString *const TTTSecondPlayerWin = @"Победил второй игрок!";
NSString *const TTTDraw = @"Ничья!";

@interface TTTGameController ()

@end

@implementation TTTGameController

@synthesize currentPlayer;
@synthesize gameGrid;
@synthesize gameStepCount;

- (id)initWithGameGrid:(NSMutableArray *)grid {
    self = [TTTGameController new];
    if(self) {
        [self setGameGrid:grid];
        for(TTTGameCell *gameCell in self.gameGrid) {
            [gameCell resetGameValue];
        }
        [self setCurrentPlayer:TTTPlayerFirstPlayer];
        [self setGameStepCount:TTTGameStepPreBeginStep];
    }
    return self;
}

- (void)gameCellClick:(TTTGameCell *)gameCell {
    [gameCell setEnabled:NO];
    if(self.currentPlayer == TTTPlayerFirstPlayer) {
        [self firstGamerClickForGameCell:gameCell];
    } else {
        [self secondGamerClickForGameCell:gameCell];
    }
    [self gameStepForGameCell:gameCell];
}

- (void)firstGamerClickForGameCell:(TTTGameCell *)gameCell {
    [self setCurrentPlayer:TTTPlayerSecondPlayer];
    [gameCell firstGamerClick];
}

- (void)secondGamerClickForGameCell:(TTTGameCell *)gameCell {
    [self setCurrentPlayer:TTTPlayerFirstPlayer];
    [gameCell secondGamerClick];
}

- (void)gameStepForGameCell:(TTTGameCell *)gameCell {
    gameStepCount++;
    for(TTTGameCell *cell in self.gameGrid) {
        if(cell.tag == gameCell.tag) {
            [cell setCurrentGameValue:gameCell.currentGameValue];
        }
    }
    if([self gameStatus] == TTTGameStatusFirstWin) {
        [self showAlertWithTitle:TTTFirtsPlayerWin];
        [self endGame];
    } else if([self gameStatus] == TTTGameStatusSecondWin) {
        [self showAlertWithTitle:TTTSecondPlayerWin];
        [self endGame];
    } else if(([self gameStatus] == TTTGameStatusDraw) && (self.gameStepCount == TTTGameStepEndStep)) {
        [self showAlertWithTitle:TTTDraw];
        [self endGame];
    }
}

- (NSUInteger)gameStatus {
    NSUInteger gameStatus = TTTGameStatusDraw;
    NSMutableArray *grid = self.gameGrid;
    
    //calculating game line values
    NSNumber *firstHorizLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[0] currentGameValue] + [(TTTGameCell *)grid[1] currentGameValue] + [(TTTGameCell *)grid[2] currentGameValue]];
    NSNumber *secondHorizLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[3] currentGameValue] + [(TTTGameCell *)grid[4] currentGameValue] + [(TTTGameCell *)grid[5] currentGameValue]];
    NSNumber *thirdHorizLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[6] currentGameValue] + [(TTTGameCell *)grid[7] currentGameValue] + [(TTTGameCell *)grid[8] currentGameValue]];
    
    NSNumber *firstVertLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[0] currentGameValue] + [(TTTGameCell *)grid[3] currentGameValue] + [(TTTGameCell *)grid[6] currentGameValue]];
    NSNumber *secondVertLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[1] currentGameValue] + [(TTTGameCell *)grid[4] currentGameValue] + [(TTTGameCell *)grid[7] currentGameValue]];
    NSNumber *thirdVertLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[2] currentGameValue] + [(TTTGameCell *)grid[5] currentGameValue] + [(TTTGameCell *)grid[8] currentGameValue]];
    
    NSNumber *firstDiagonalLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[0] currentGameValue] + [(TTTGameCell *)grid[4] currentGameValue] + [(TTTGameCell *)grid[8] currentGameValue]];
    NSNumber *secondDiagonalLine = [NSNumber numberWithInteger:[(TTTGameCell *)grid[2] currentGameValue] + [(TTTGameCell *)grid[4] currentGameValue] + [(TTTGameCell *)grid[6] currentGameValue]];
    
    NSMutableArray *gameLineValues = (NSMutableArray *)@[firstHorizLine,secondHorizLine, thirdHorizLine, firstVertLine, secondVertLine, thirdVertLine, firstDiagonalLine, secondDiagonalLine];
    
    for(NSNumber *gameLineValue in gameLineValues) {
        if([gameLineValue integerValue] == TTTGameStatusFirstWin) {
            gameStatus = TTTGameStatusFirstWin;
        } else if ([gameLineValue integerValue] == TTTGameStatusSecondWin) {
            gameStatus = TTTGameStatusSecondWin;
        }
    }
    
    return gameStatus;
}

- (void)showAlertWithTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)endGame {
    for(TTTGameCell *gameCell in self.gameGrid) {
        [gameCell setEnabled:NO];
    }
}

@end
