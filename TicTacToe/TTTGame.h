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

@interface TTTGame : NSObject

@property (nonatomic, strong) NSMutableArray *gameGrid;
@property (nonatomic, assign) NSUInteger currentPlayer;

- (id)initWithGameGrid:(NSMutableArray *)gameGrid;
- (void)gameCellClick:(TTTGameCell *)gameCell;

@end
