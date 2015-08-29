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

@property (nonatomic, strong) NSMutableArray *gameGrid;
@property (nonatomic, assign) NSUInteger currentPlayer;
@property (nonatomic, assign) NSUInteger gameStepCount;

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
    
    NSUInteger gameStatus = [self gameStatus];
    if(gameStatus == TTTGameStatusFirstWin) {
        [self showAlertWithTitle:TTTFirtsPlayerWin];
        [self endGame];
    } else if(gameStatus == TTTGameStatusSecondWin) {
        [self showAlertWithTitle:TTTSecondPlayerWin];
        [self endGame];
    } else if((gameStatus == TTTGameStatusDraw) && (self.gameStepCount == TTTGameStepEndStep)) {
        [self showAlertWithTitle:TTTDraw];
        [self endGame];
    }
}

- (NSUInteger)gameStatus {
    NSUInteger gameStatus = TTTGameStatusDraw;
    NSMutableArray *grid = self.gameGrid;
    
    //calculating game line values
    NSNumber *firstHorizLine        = [self gameLineValueFromGameCells:@[grid[0], grid[1], grid[2]]];
    NSNumber *secondHorizLine       = [self gameLineValueFromGameCells:@[grid[3], grid[4], grid[5]]];
    NSNumber *thirdHorizLine        = [self gameLineValueFromGameCells:@[grid[6], grid[7], grid[8]]];
    
    NSNumber *firstVertLine         = [self gameLineValueFromGameCells:@[grid[0], grid[3], grid[6]]];
    NSNumber *secondVertLine        = [self gameLineValueFromGameCells:@[grid[1], grid[4], grid[7]]];
    NSNumber *thirdVertLine         = [self gameLineValueFromGameCells:@[grid[2], grid[5], grid[8]]];
    
    NSNumber *firstDiagonalLine     = [self gameLineValueFromGameCells:@[grid[0], grid[4], grid[8]]];
    NSNumber *secondDiagonalLine    = [self gameLineValueFromGameCells:@[grid[2], grid[4], grid[6]]];
    
    NSMutableArray *gameLineValues = (NSMutableArray *)@[firstHorizLine, secondHorizLine, thirdHorizLine, firstVertLine, secondVertLine, thirdVertLine, firstDiagonalLine, secondDiagonalLine];
    
    for(NSNumber *gameLineValue in gameLineValues) {
        if([gameLineValue integerValue] == TTTGameStatusFirstWin) {
            gameStatus = TTTGameStatusFirstWin;
        } else if ([gameLineValue integerValue] == TTTGameStatusSecondWin) {
            gameStatus = TTTGameStatusSecondWin;
        }
    }
    
    return gameStatus;
}

- (NSNumber *)gameLineValueFromGameCells:(NSArray *)gameCells {
    NSInteger gameLineValue = 0;
    for(int i = 0; i < [gameCells count]; i++) {
        gameLineValue += [(TTTGameCell *)gameCells[i] currentGameValue];
    }
    return [NSNumber numberWithInteger:gameLineValue];
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
