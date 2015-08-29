//
//  TTTGame.h
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTTGameCell;

typedef NS_ENUM(NSUInteger, TTTPlayer) {
    TTTPlayerFirstPlayer = 1,
    TTTPlayerSecondPlayer = 2,
};

typedef NS_ENUM(NSUInteger, TTTGameStatus) {
    TTTGameStatusDraw = 0,
    TTTGameStatusFirstWin = 3,
    TTTGameStatusSecondWin = 12,
};

typedef NS_ENUM(NSUInteger, TTTGameStep) {
    TTTGameStepPreBeginStep = 0,
    TTTGameStepEndStep = 9,
};

@interface TTTGame : NSObject

@property (nonatomic, strong) NSMutableArray *gameGrid;
@property (nonatomic, assign) NSUInteger currentPlayer;
@property (nonatomic, assign) NSUInteger gameStepCount;

- (id)initWithGameGrid:(NSMutableArray *)gameGrid;
- (void)gameCellClick:(TTTGameCell *)gameCell;

@end
